
##
## Creates an ACM for www.starwarsccg.org and starwarsccg.org
##
module "www_starwarsccg_org" {
  source            = "../../modules/aws-acm-certificate"
  domain_name       = "starwarsccg.org"
  alt_domains       = ["www.starwarsccg.org"]
  env_name          = "prod"
} ## module

##
## Creates an ACM for store.starwarsccg.org
##
module "store_starwarsccg_org" {
  source            = "../../modules/aws-acm-certificate"
  domain_name       = "store.starwarsccg.org"
  env_name          = "prod"
} ## module

##
## Creates an ACM for forum.starwarsccg.org
##
module "forum_starwarsccg_org" {
  source            = "../../modules/aws-acm-certificate"
  domain_name       = "forum.starwarsccg.org"
  env_name          = "prod"
} ## module

