
module "gempserver" {
  source            = "../../modules/aws-ec2-gemp"
  aws_region        = var.aws_region
  vpc_id            = "vpc-4336702b"
} ## module




