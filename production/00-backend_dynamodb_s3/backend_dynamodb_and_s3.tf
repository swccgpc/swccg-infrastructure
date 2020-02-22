
module "aws_terraform_backend" {
  source      = "../../modules/aws-terraform-backend"
  env_name    = "prod"
  aws_profile = var.aws_profile
  aws_region  = var.aws_region
} ## module

