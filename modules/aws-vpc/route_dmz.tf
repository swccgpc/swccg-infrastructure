
##
## Define DMZ Route Tables
##

resource "aws_route_table" "dmz" {
  vpc_id = aws_vpc.vpc.id

  ## The VPC CIDR is implicitly mapped to *local*
  ## and cannot be specified.

  route {
    cidr_block = "0.0.0.0/0"
    ## DMZ subnets get the IGW as the gateway of last resort
    ## Trust subnets get the NAT gateway as the gateway of last resort
    ## gateway_id: use for IGW
    ## nat_gateway_id: use for NAT gw
    gateway_id = aws_internet_gateway.igw.id
  } ## route

  tags = {
    Name        = "${var.env_name}_dmz${count.index+1}"
    Environment = var.env_name
    Owner       = "Created by Terraform"
  } ## tags

  count = var.number_of_azs

} ## resource aws_route_table


##
## Allocate Route Tables to Subnets
##

resource "aws_route_table_association" "dmz" {
  subnet_id      = aws_subnet.dmz[count.index].id
  route_table_id = aws_route_table.dmz[count.index].id

  count = var.number_of_azs
} ## resource aws_route_table_association





