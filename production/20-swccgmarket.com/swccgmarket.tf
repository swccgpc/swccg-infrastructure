

module "swccgmarket_com" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "swccgmarket.com"
  redirect_target   = "https://store.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "swccgmarket_com" {
  zone_id = data.terraform_remote_state.r53.outputs.swccgmarket_com_zone_id
  name    = "swccgmarket.com"
  type    = "A"

  alias {
    name                   = module.swccgmarket_com.website_domain # "www.swccgmarket.com.s3-website.us-east-2.amazonaws.com"
    zone_id                = module.swccgmarket_com.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this



module "www_swccgmarket_com" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "www.swccgmarket.com"
  redirect_target   = "https://store.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "www_swccgmarket_com" {
  zone_id = data.terraform_remote_state.r53.outputs.swccgmarket_com_zone_id
  name    = "www.swccgmarket.com"
  type    = "A"

  alias {
    name                   = module.www_swccgmarket_com.website_domain # "www.swccgmarket.com.s3-website.us-east-2.amazonaws.com"
    zone_id                = module.www_swccgmarket_com.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this

