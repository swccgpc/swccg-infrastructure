
##
## StarWarsCCG.org
##

output "zone_id" {
  description = "Route53 Zone ID"
  value       = module.starwarsccg_org.zone_id
}

output "name_servers" {
  description = "Route53 Name Servers"
  value       = module.starwarsccg_org.name_servers
}


##
## Other Domains
##

output "starwarsccg_org_zone_id" {
  description = "Route53 Zone ID"
  value       = module.starwarsccg_org.zone_id
}

output "swccg_org_zone_id" {
  description = "Route53 Zone ID"
  value       = module.swccg_org.zone_id
}

output "decktech_net_zone_id" {
  description = "Route53 Zone ID"
  value       = module.decktech_net.zone_id
}

output "swccgmarket_com_zone_id" {
  description = "Route53 Zone ID"
  value       = module.swccgmarket_com.zone_id
}

output "swccgpc_com_zone_id" {
  description = "Route53 Zone ID"
  value       = module.swccgpc_com.zone_id
}

output "swwork_org_zone_id" {
  description = "Route53 Zone ID"
  value       = module.swwork_org.zone_id
}



