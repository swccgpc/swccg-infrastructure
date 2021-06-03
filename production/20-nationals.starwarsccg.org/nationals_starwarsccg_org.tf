

module "nationals_starwarsccg_org" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "nationals.starwarsccg.org"
  redirect_target   = "https://www.starwarsccg.org/the-game-awakens-star-wars-ccg-returns-to-live-majors-july-16-18-in-denver-co/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


resource "aws_route53_record" "nationals_starwarsccg_org" {
  zone_id = data.terraform_remote_state.r53.outputs.starwarsccg_org_zone_id
  name    = "nationals.starwarsccg.org"
  type    = "A"

  alias {
    name                   = module.nationals_starwarsccg_org.website_domain # "www.nationals.com.s3-website.us-east-2.amazonaws.com"
    zone_id                = module.nationals_starwarsccg_org.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this



