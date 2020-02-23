
resource "aws_route53_zone" "zone" {
  name    = var.zone_name
  comment = "${var.zone_name} public zone"

  tags = {
    Name    = var.zone_name
    Purpose = "Public ${var.zone_name}"
  }
} ## resource


