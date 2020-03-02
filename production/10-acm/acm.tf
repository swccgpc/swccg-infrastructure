
##
## Creates an ACM for www.starwarsccg.org and starwarsccg.org
##
module "www_starwarsccg_org_use1" {
  source            = "../../modules/aws-acm-certificate"
  domain_name       = "starwarsccg.org"
  alt_domains       = ["*.starwarsccg.org", "www.starwarsccg.org"]
  env_name          = "prod"
  aws_profile       = var.aws_profile
  providers         = { aws=aws.use1 }
} ## module

module "www_starwarsccg_org_use2" {
  source            = "../../modules/aws-acm-certificate"
  domain_name       = "starwarsccg.org"
  alt_domains       = ["*.starwarsccg.org", "www.starwarsccg.org"]
  env_name          = "prod"
  aws_profile       = var.aws_profile
  aws_region        = "us-east-2"
} ## module
