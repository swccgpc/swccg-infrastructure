
resource "aws_route53_record" "this" {
  for_each = var.dns_entries
  zone_id  = aws_route53_zone.zone.zone_id
  name     = var.dns_entries[each.key]["name"]
  type     = var.dns_entries[each.key]["type"]
  ttl      = var.dns_entries[each.key]["ttl"]
  records  = var.dns_entries[each.key]["records"]
}

