
module "www_starwarsccg_org" {
  source            = "../../modules/aws-s3-website"
  s3_bucket_name    = "www.starwarsccg.org"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module

module "starwarsccg_org" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "starwarsccg.org"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module

