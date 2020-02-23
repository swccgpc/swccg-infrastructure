
##
## Internet Gateway
##

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.env_name}_igw"
    Environment = var.env_name
    Owner       = "Created by Terraform"
  } ## tags

} ## resource aws_internet_gateway igw
