
module "res_starwarsccg_org" {
  source            = "../../modules/aws-s3-website"
  s3_bucket_name    = "res.starwarsccg.org"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


