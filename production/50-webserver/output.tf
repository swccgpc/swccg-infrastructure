
output "instance_public_ip" {
  description = "instance_public_ip"
  value       = module.webserver.instance_public_ip
}

output "instance_private_ip" {
  description = "instance_private_ip"
  value       = module.webserver.instance_private_ip
}

output "instance_id" {
  description = "instance_id"
  value       = module.webserver.instance_id
}

output "security_group_web_id" {
  description = "Security Group Web ID"
  value       = module.webserver.security_group_web_id
}




output "aws_lb_arn" {
  description = "aws_lb arn"
  value       = module.webserver.aws_lb_arn
} ## output aws_lb_arn

output "aws_lb_dns_name" {
  description = "aws_lb dns_name"
  value       = module.webserver.aws_lb_dns_name
} ## output aws_lb_dns_name

output "aws_lb_zone_id" {
  description = "aws_lb zone_id"
  value       = module.webserver.aws_lb_zone_id
} ## output aws_lb_zone_id







output "route53_webserver_name" {
  description = "instance_id"
  value       = aws_route53_record.webserver.name
}

output "route53_webserver_fqdn" {
  description = "instance_id"
  value       = aws_route53_record.webserver.fqdn
}

