
output "zone_id" {
  description = "Route53 Zone ID"
  value       = aws_route53_zone.zone.id
}

output "name_servers" {
  description = "Route53 Name Servers"
  value       = aws_route53_zone.zone.name_servers
}

