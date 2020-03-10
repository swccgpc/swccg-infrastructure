
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

module "swccgpc_com" {
  source    = "../../modules/aws-route53-zone-public"
  zone_name = "swccgpc.com"
  dns_entries = var.swccgpc_com_dns_entries
} ## module swccgpc_com

module "decktech_net" {
  source    = "../../modules/aws-route53-zone-public"
  zone_name = "decktech.net"
  dns_entries = var.decktech_net_dns_entries
} ## module decktech_net

module "swccgmarket_com" {
  source      = "../../modules/aws-route53-zone-public"
  zone_name   = "swccgmarket.com"
  dns_entries = var.swccgmarket_com_dns_entries
} ## module swccg_org

module "swwork_org" {
  source      = "../../modules/aws-route53-zone-public"
  zone_name   = "swwork.org"
  dns_entries = var.swwork_org_dns_entries
} ## module swwork_org





