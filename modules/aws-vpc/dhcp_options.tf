
resource "aws_vpc_dhcp_options" "options" {
  domain_name          = local.domain_name_for_dhcp_options
  domain_name_servers  = ["AmazonProvidedDNS"]
  # Amazon Time Service
  # https://aws.amazon.com/blogs/aws/keeping-time-with-amazon-time-sync-service/
  ntp_servers          = ["169.254.169.123"]
  #netbios_name_servers = ["127.0.0.1"]
  #netbios_node_type    = 2

  tags = {
    Name        = "${var.env_name} ${local.timestamp_for_dhcp_options}"
    Environment = var.env_name
    Owner       = "Created by Terraform"
    Purpose     = "For VPC ${var.env_name}"
  }
}

##
## If using AmazonProvidedDNS in us-east-1: specify ec2.internal.
## If using AmazonProvidedDNS in another region, specify: region.compute.internal
## for example, ap-northeast-1.compute.internal
##

locals {
  domain_name_for_dhcp_options = "${var.aws_region == "us-east-1" ? "ec2.internal" : "${var.aws_region}.compute.internal" }"
  timestamp_for_dhcp_options   = formatdate("YYYY-MM-DD", timestamp())
}

resource "aws_vpc_dhcp_options_association" "association" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.options.id
}


