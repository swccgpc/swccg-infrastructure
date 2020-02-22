
data "aws_caller_identity" "current" {}

###################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "env_name" {
  description = "Environment Name"
  type        = string
} ## variable


variable "s3_bucket_name" {
  description = "Website base URL, such as www.starwarsccg.org"
  type        = string
} ## variable







