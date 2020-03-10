

module "decktech_net" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "decktech.net"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "decktech_net" {
  zone_id = data.terraform_remote_state.r53.outputs.decktech_net_zone_id
  name    = "decktech.net"
  type    = "A"

  alias {
    name                   = module.decktech_net.website_domain
    zone_id                = module.decktech_net.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this



module "www_decktech_net" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "www.decktech.net"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module

resource "aws_route53_record" "www_decktech_net" {
  zone_id = data.terraform_remote_state.r53.outputs.decktech_net_zone_id
  name    = "www.decktech.net"
  type    = "A"

  alias {
    name                   = module.www_decktech_net.website_domain
    zone_id                = module.www_decktech_net.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this



