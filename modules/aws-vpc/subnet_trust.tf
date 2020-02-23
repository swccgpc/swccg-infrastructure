
##
## Trust
##

resource "aws_subnet" "trust" {
  count                   = var.number_of_azs
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.vpc_subnets_trust[count.index]
  availability_zone       = local.vpc_azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.env_name}_trust${count.index+1}"
    Environment = var.env_name
    Owner       = "Created by Terraform"
    Purpose     = "Trust Zone"
  } ## tags

} ## resource aws_subnet trust
