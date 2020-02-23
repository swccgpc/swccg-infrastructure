
##
## VPC
##

resource "aws_vpc" "vpc" {
  cidr_block = local.vpc_cidr

  ## Enable DNS settings
  ## So can use service discovery
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = var.env_name
    Environment = var.env_name
    Owner       = "Created by Terraform"
  } ## tags

} ## resource aws_vpc vpc

