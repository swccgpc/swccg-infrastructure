
resource "aws_route53_record" "h_starwarsccg_org" {
  zone_id = data.terraform_remote_state.r53.outputs.zone_id
  name    = "h.starwarsccg.org"
  type    = "CNAME"
  ttl     = 500
  records = ["res.starwarsccg.org"]

} ## resource aws_route53_record h_starwarsccg_org


