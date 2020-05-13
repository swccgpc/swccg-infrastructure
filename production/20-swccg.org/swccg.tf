

module "swccg_org" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "swccg.org"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "swccg_org" {
  zone_id = data.terraform_remote_state.r53.outputs.swccg_org_zone_id
  name    = "swccg.org"
  type    = "A"

  alias {
    name                   = module.swccg_org.website_domain
    zone_id                = module.swccg_org.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this



module "www_swccg_org" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "www.swccg.org"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "www_swccg_org" {
  zone_id = data.terraform_remote_state.r53.outputs.swccg_org_zone_id
  name    = "www.swccg.org"
  type    = "A"

  alias {
    name                   = module.www_swccg_org.website_domain
    zone_id                = module.www_swccg_org.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this

