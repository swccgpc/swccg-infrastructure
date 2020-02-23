
##
## VPC Gateway Endpoints
##
resource "aws_vpc_endpoint" "gateway" {
  count             = length(var.aws_vpc_gateway_endpoints)
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.aws_region}.${var.aws_vpc_gateway_endpoints[count.index]}"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = concat(aws_route_table.dmz.*.id, aws_route_table.trust.*.id)

  tags = {
    Name        = "${var.env_name}_${var.aws_vpc_gateway_endpoints[count.index]}"
    Environment = var.env_name
    Purpose     = "${var.aws_vpc_gateway_endpoints[count.index]} Gateway Endpoint"
  }
}



##
## VPC Interface Endpoints
##


resource "aws_security_group" "endpoints" {

  name        = "endpoints"
  description = "VPC Interface Endpoints"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL Out"
  } ## ingress

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL Out"
  } ## ingress

  tags = {
    Name        = "endpoints"
    Environment = var.env_name
    Owner       = "Created by Terraform"
    Description = "VPC Interface Endpoints"
  } ## tags

} ## resource




resource "aws_vpc_endpoint" "interface" {
  count               = length(var.aws_vpc_interface_endpoints)
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${var.aws_region}.${var.aws_vpc_interface_endpoints[count.index]}"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.endpoints.id]
  ## Interface endpoints can only have ONE per AZ, so they all land in the DMZ here.
  subnet_ids          = aws_subnet.dmz.*.id

  tags = {
    Name        = "${var.env_name}_${var.aws_vpc_interface_endpoints[count.index]}"
    Environment = var.env_name
    Owner       = "Created by Terraform"
    Purpose     = "${var.aws_vpc_interface_endpoints[count.index]} Interface Endpoint"
  }
}

