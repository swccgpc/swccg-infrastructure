
##
## Define Trust Route Tables
##
resource "aws_route_table" "trust" {
  count  = var.number_of_azs
  vpc_id = aws_vpc.vpc.id

  ## The VPC CIDR is implicitly mapped to *local*
  ## and cannot be specified.

  route {
    cidr_block = "0.0.0.0/0"
    ## DMZ subnets get the IGW as the gateway of last resort
    ## Trust subnets get the NAT gateway as the gateway of last resort
    ## gateway_id: use for IGW
    ## nat_gateway_id: use for NAT gw
    ## nat_gateway_id = aws_nat_gateway.nat[count.index].id

    ##
    ## Normally the trust zone has a NAT gateway
    ## However, the NAT gateway costs money.
    ## So use the Internet Gateway for now...
    ##
    gateway_id = aws_internet_gateway.igw.id

  } ## route

  tags = {
    Name        = "${var.env_name}_trust${count.index+1}"
    Environment = var.env_name
    Owner       = "Created by Terraform"
  } ## tags

} ## resource aws_route_table


##
## Allocate Route Tables to Subnets
##

resource "aws_route_table_association" "trust" {
  subnet_id      = aws_subnet.trust[count.index].id
  route_table_id = aws_route_table.trust[count.index].id

  count = var.number_of_azs
} ## resource aws_route_table_association



