
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile"
  type        = string
}

variable "env_name" {
  description = "Environment Name"
  type        = string
}

locals {
  aws_region_nodashes = replace(var.aws_region, "-", "")
  s3_bucket_name      = "${local.aws_region_nodashes}-swccg-tfstate-${var.env_name}"
  dynamodb_table_name = "${local.aws_region_nodashes}-swccg-tflock-${var.env_name}"
}
