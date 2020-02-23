
##
## DMZ
##

resource "aws_subnet" "dmz" {
  count                   = var.number_of_azs
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.vpc_subnets_dmz[count.index]
  availability_zone       = local.vpc_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env_name}_dmz${count.index+1}"
    Environment = var.env_name
    Owner       = "Created by Terraform"
    Purpose     = "DMZ"
  } ## tags

} ## resource aws_subnet dmz







