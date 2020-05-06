variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

###################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

####################################

locals {
  aws_region_nodashes = replace(var.aws_region, "-", "")
}

