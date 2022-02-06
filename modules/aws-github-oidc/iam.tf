



variable "github_orgs" {
  description = "GitHub Organizations"
  type        = list
  default     = ["swccgpc"]
} ## variable

variable "github_repos" {
  description = "GitHub Repositories"
  #type        = map
  #type = map(object({repo=string,policies=map}))
} ## variable

#variable "policies" {
#  description = "Role Policies"
#  type        = map(map(string))
#} ## variable

data "aws_caller_identity" "current" {}

##
## IAM OIDC identity providers are entities in IAM that describe an 
## external identity provider (IdP) service that supports 
## the OpenID Connect (OIDC) standard.
##
## You use an IAM OIDC identity provider when you want to establish 
## trust between an OIDC-compatible IdP and your AWS account.
##

locals {
  account_id  = data.aws_caller_identity.current.account_id
  client_ids  = [for i in var.github_orgs  : "https://github.com/${i}"]
}



##
## Create OpenID Provider for GitHub
## https://registry.terraform.io/providers/hashicorp/aws%20%20/latest/docs/resources/iam_openid_connect_provider
##
resource "aws_iam_openid_connect_provider" "GitHubOidcProvider" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = local.client_ids

  ##
  ## A list of server certificate thumbprints for the OpenID Connect (OIDC) 
  ## identity provider’s server certificates. 
  ## Typically this list includes only one entry. 
  ## However, IAM lets you have up to five thumbprints for an OIDC provider. 
  ## This lets you maintain multiple thumbprints if the identity provider 
  ## is rotating certificates. 
  ## The server certificate thumbprint is the hex-encoded SHA-1 
  ## hash value of the X.509 certificate used by the domain where 
  ## the OpenID Connect provider makes its keys available.
  ##
  thumbprint_list = ["a031c46782e6e6c662c2c87c76da9aa62ccabd8e"]
}



##
## IAM Role that will be assumed by the READING GitHub Action
## This GitHub action uses the Python module, rather than creating it.
##
resource "aws_iam_role" "githubactionsrole" {
  for_each           = var.github_repos
  name               = "githuboidc-${each.key}"
  description        = "Role for ${each.key} GitHub Actions"
  #managed_policy_arns=["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {"Federated": "arn:aws:iam::${local.account_id}:oidc-provider/token.actions.githubusercontent.com"},
    "Action": "sts:AssumeRoleWithWebIdentity",
    "Condition": {
      "StringLike": {
        "token.actions.githubusercontent.com:sub": "repo:${var.github_repos[each.key]["repo"]}:ref:refs/heads/main"
      }
    }
  }]
}
EOF

  dynamic "inline_policy" {
    for_each = var.github_repos[each.key]["policies"]
    content {
      name   = inline_policy.key
      policy = inline_policy.value
    }
  }


  tags = {
    Name    = "githuboidc-${each.key}"
    Origin  = "Created by Terraform"
    Owner   = "${each.key}"
    Purpose = "${each.key} GitHub Repo Workflow Actions"
  } ### tags
} ### aws_iam_role









