
module "codedeploy" {
  source = "../../modules/aws-codedeploy"
  applications = var.applications
} ## module

