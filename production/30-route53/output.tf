
output "zone_id" {
  description = "Route53 Zone ID"
  value       = module.starwarsccg_org.zone_id
}

output "name_servers" {
  description = "Route53 Name Servers"
  value       = module.starwarsccg_org.name_servers
}