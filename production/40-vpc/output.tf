
output "vpc_id" {
  description = "aws_vpc vpc id"
  value       = module.prodvpc.vpc_id
}






output "aws_subnet_dmz1_id" {
  description = "aws_subnet dmz1 id"
  value       = module.prodvpc.aws_subnet_dmz_ids[0]
}
output "aws_subnet_dmz2_id" {
  description = "aws_subnet dmz2 id"
  value       = module.prodvpc.aws_subnet_dmz_ids[1]
}
output "aws_subnet_dmz3_id" {
  description = "aws_subnet dmz3 id"
  value       = module.prodvpc.aws_subnet_dmz_ids[2]
}



output "aws_subnet_trust1_id" {
  description = "aws_subnet trust1 id"
  value       = module.prodvpc.aws_subnet_trust_ids[0]
}
output "aws_subnet_trust2_id" {
  description = "aws_subnet trust2 id"
  value       = module.prodvpc.aws_subnet_trust_ids[1]
}
output "aws_subnet_trust3_id" {
  description = "aws_subnet trust3 id"
  value       = module.prodvpc.aws_subnet_trust_ids[2]
}



