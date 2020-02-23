
output "vpc_id" {
  description = "aws_vpc vpc id"
  value       = aws_vpc.vpc.id
}


##
## IGW ID
##

output "igw_id" {
  description = "aws_internet_gateway igw id"
  value       = aws_internet_gateway.igw.id
}



##
## DMZ Route Table IDs
##

output "aws_route_table_dmz_ids" {
  description = "aws_route_table dmz ids"
  value       = "${aws_route_table.dmz.*.id}"
}



##
## TRUST Route Table IDs
##

output "aws_route_table_trust_ids" {
  description = "aws_route_table trust ids"
  value       = "${aws_route_table.trust.*.id}"
}



##
## DMZ Subnet IDs
##
output "aws_subnet_dmz_ids" {
  description = "aws_subnet dmz ids"
  value       = "${aws_subnet.dmz.*.id}"
}





##
## TRUST Subnet IDs
##
output "aws_subnet_trust_ids" {
  description = "aws_subnet trust ids"
  value       = "${aws_subnet.trust.*.id}"
}







