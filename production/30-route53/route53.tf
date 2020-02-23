
module "starwarsccg_org" {
  source    = "../../modules/aws-route53-zone-public"
  zone_name = "starwarsccg.org"
  dns_entries = var.starwarsccg_org_dns_entries
} ## module starwarsccg_org

module "swccg_org" {
  source    = "../../modules/aws-route53-zone-public"
  zone_name = "swccg.org"
  dns_entries = var.swccg_org_dns_entries
} ## module swccg_org

