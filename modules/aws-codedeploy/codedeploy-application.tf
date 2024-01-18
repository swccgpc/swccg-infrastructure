
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app
resource "aws_codedeploy_app" "this" {
  for_each = toset(var.applications)
  name     = each.key
  compute_platform = "Server"
}



