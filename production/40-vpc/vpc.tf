
module "prodvpc" {
  source            = "../../modules/aws-vpc"
  env_name          = "prod"
  aws_region        = var.aws_region
  ip_first_two_bits = "10.42"
  ## can only create subnets in:
  ##   us-east-2b, us-east-2c, us-east-2a
  number_of_azs     = 3
} ## module
