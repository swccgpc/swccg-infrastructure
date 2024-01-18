
resource "aws_iam_policy" "codedeploy_from_github" {
  name   = "codedeploy_from_github"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s3",
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:Put*",
        "s3:List*"
      ],
      "Resource": "arn:aws:s3:::swccg-codedeploy/swccg-tournament.zip"
    },{
      "Sid": "s3ls",
      "Effect": "Allow",
      "Action": [
        "s3:List*"
      ],
      "Resource": ["arn:aws:s3:::swccg-codedeploy", "arn:aws:s3:::swccg-codedeploy/*"]
    },{
      "Sid": "codedeployget",
      "Effect": "Allow",
      "Action": [
        "codedeploy:GetDeploymentConfig",
        "codedeploy:Get*",
        "codedeploy:List*"
      ],
      "Resource": "arn:aws:codedeploy:us-east-2:230787692442:*:*"
    },{
      "Sid": "codedeploycreate",
      "Effect": "Allow",
      "Action": [
        "codedeploy:CreateDeployment",
        "codedeploy:ContinueDeployment",
        "codedeploy:GetDeploymentConfig",
        "codedeploy:List*"
      ],
      "Resource": ["arn:aws:codedeploy:us-east-2:230787692442:deploymentgroup:swccg-tournament/web",
                   "arn:aws:codedeploy:us-east-2:230787692442:deploymentconfig:CodeDeployDefault.AllAtOnce"]
    },{
      "Sid": "codedeployrevision",
      "Effect": "Allow",
      "Action": [
        "codedeploy:RegisterApplicationRevision"
      ],
      "Resource": "arn:aws:codedeploy:us-east-2:230787692442:application:swccg-tournament"
    }
  ]
}
EOF
} ### aws_iam_policy
#arn:aws:codedeploy:region:account-id:deploymentgroup:application-name/deployment-group-name


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "codedeploy_from_github" {
  name               = "swccg_codedeploy_from_github"
  description        = "Role to assume from GitHub for triggering CodeDeploy"
  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
  {
    "Effect": "Allow",
    "Principal": {
      "Federated": "arn:aws:iam::230787692442:oidc-provider/token.actions.githubusercontent.com"
    },
    "Action": "sts:AssumeRoleWithWebIdentity",
    "Condition": {
        "StringEquals": {
            "token.actions.githubusercontent.com:sub": "repo:swccgpc/tournament:ref:refs/heads/master",
            "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        }
    }
  }
]}
EOF
}

resource "aws_iam_policy_attachment" "codedeploy_from_github" {
  name       = "codedeploy_from_github"
  roles      = [aws_iam_role.codedeploy_from_github.name]
  policy_arn = aws_iam_policy.codedeploy_from_github.arn
}

