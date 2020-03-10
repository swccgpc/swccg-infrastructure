

module "swccgpc_com" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "swccgpc.com"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "swccgpc_com" {
  zone_id = data.terraform_remote_state.r53.outputs.swccgpc_com_zone_id
  name    = "swccgpc.com"
  type    = "A"

  alias {
    name                   = module.swccgpc_com.website_domain
    zone_id                = module.swccgpc_com.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this



module "www_swccgpc_com" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "www.swccgpc.com"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "www_swccgpc_com" {
  zone_id = data.terraform_remote_state.r53.outputs.swccgpc_com_zone_id
  name    = "www.swccgpc.com"
  type    = "A"

  alias {
    name                   = module.www_swccgpc_com.website_domain
    zone_id                = module.www_swccgpc_com.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this

