
module "vkit_starwarsccg_org" {
  source            = "../../modules/aws-s3-website"
  s3_bucket_name    = "vkit.starwarsccg.org"
  domain_names      = ["vkit.starwarsccg.org"]
  acm_arn           = data.terraform_remote_state.acm.outputs.www_starwarsccg_org_acm_certificate_arn
  route53_zone_id   = data.terraform_remote_state.r53.outputs.zone_id
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module


