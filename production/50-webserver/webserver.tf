
module "webserver" {
  source            = "../../modules/aws-ec2-webserver"
  env_name          = "prod"
  aws_region        = var.aws_region
  app_name          = "web"  
  instance_id       = "001"
  fqdn              = "starwarsccg.org"
  instance_type     = "t3a.small"
  subnet_id         = data.terraform_remote_state.vpc.outputs.aws_subnet_trust1_id
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  acm_arn           = data.terraform_remote_state.acm.outputs.www_starwarsccg_org_use2_acm_certificate_arn
  alb_subnets       = [data.terraform_remote_state.vpc.outputs.aws_subnet_dmz1_id,
                       data.terraform_remote_state.vpc.outputs.aws_subnet_dmz2_id,
                       data.terraform_remote_state.vpc.outputs.aws_subnet_dmz3_id]
} ## module


resource "aws_route53_record" "webserver" {
  zone_id = data.terraform_remote_state.r53.outputs.zone_id
  name    = "useast2-web-001"
  type    = "A"
  ttl     = "300"
  records = [module.webserver.instance_public_ip]
}


resource "aws_route53_record" "store" {
  zone_id = data.terraform_remote_state.r53.outputs.zone_id
  name    = "store.starwarsccg.org"
  type    = "A"

  alias {
    name                   = module.webserver.aws_lb_dns_name
    zone_id                = module.webserver.aws_lb_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record store


resource "aws_route53_record" "forum" {
  zone_id = data.terraform_remote_state.r53.outputs.zone_id
  name    = "forum.starwarsccg.org"
  type    = "A"

  alias {
    name                   = module.webserver.aws_lb_dns_name
    zone_id                = module.webserver.aws_lb_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record forum

resource "aws_route53_record" "forumtest" {
  zone_id = data.terraform_remote_state.r53.outputs.zone_id
  name    = "forum-test.starwarsccg.org"
  type    = "A"

  alias {
    name                   = module.webserver.aws_lb_dns_name
    zone_id                = module.webserver.aws_lb_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record forum













