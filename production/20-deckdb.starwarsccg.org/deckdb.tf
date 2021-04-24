

##
## S3 Redirect Website
##
#module "deckdb_starwarsccg_org" {
#  source            = "../../modules/aws-s3-website-redirect"
#  s3_bucket_name    = "deckdb.starwarsccg.org"
#  redirect_target   = "https://swccgdb.com/"
#  env_name          = "prod"
#  aws_region        = var.aws_region
#} ## module


resource "aws_route53_record" "deckdb_starwarsccg_org" {
  zone_id = data.terraform_remote_state.r53.outputs.starwarsccg_org_zone_id
  name    = "deckdb.starwarsccg.org"
  type    = "A"

  #alias {
  #  name                   = module.deckdb_starwarsccg_org.website_domain
  #  zone_id                = module.deckdb_starwarsccg_org.hosted_zone_id
  #  evaluate_target_health = false
  #} ## alias

  alias {
    evaluate_target_health = false
    name                   = "useast2-web-1515985845.us-east-2.elb.amazonaws.com"
    zone_id                = "Z3AADJGX6KTTL2"
  } ## alias


} ## resource aws_route53_record this











##
## Secrets Manager
## RDS Username+Password Access
##
#resource "aws_secretsmanager_secret" "rds_deckdb" {
#  name = "rds_deckdb"
#} ## resource aws_secretsmanager_secret rds_deckdb

#output "rds_deckdb_arn" { value = aws_secretsmanager_secret_version.rds_deckdb.arn }
#output "rds_deckdb_id" { value = aws_secretsmanager_secret_version.rds_deckdb.id }


#resource "aws_secretsmanager_secret_version" "rds_deckdb" {
#  secret_id     = aws_secretsmanager_secret.rds_deckdb.id
#  secret_string = jsonencode(var.rds_deckdb)
#} ## resource aws_secretsmanager_secret_version rds_deckdb

#output "rds_deckdb_version_arn" { value = aws_secretsmanager_secret_version.rds_deckdb.arn }
#output "rds_deckdb_version_id" { value = aws_secretsmanager_secret_version.rds_deckdb.id }
#output "rds_deckdb_version_version" { value = aws_secretsmanager_secret_version.rds_deckdb.version_id }




