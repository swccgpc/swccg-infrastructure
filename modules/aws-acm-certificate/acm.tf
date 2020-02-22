
resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = concat(var.alt_domains, ["*.${var.domain_name}"])
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = var.domain_name
    Environment = var.env_name
    Purpose     = var.domain_name
    Owner       = "Created by Terraform"
  }

}

