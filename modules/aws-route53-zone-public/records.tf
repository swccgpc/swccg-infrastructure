
resource "aws_route53_record" "this" {
  count   = length(var.dns_entries)
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.dns_entries[count.index]["name"]
  type    = var.dns_entries[count.index]["type"]
  ttl     = var.dns_entries[count.index]["ttl"]
  records = var.dns_entries[count.index]["records"]
}

