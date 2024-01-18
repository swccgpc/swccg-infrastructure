
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group
resource "aws_codedeploy_deployment_group" "this" {
  for_each              = toset(var.applications)
  app_name              = each.key
  deployment_group_name = "web"
  service_role_arn      = aws_iam_role.codedeploy.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Application"
      type  = "KEY_AND_VALUE"
      value = "web"
    }
  }

  outdated_instances_strategy = "UPDATE"

}
