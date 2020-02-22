
data "aws_caller_identity" "current" {}

###################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "env_name" {
  description = "Environment Name"
  type        = string
  default     = "noenv0"
} ## variable

variable "s3_bucket_name" {
  description = "Website base URL, such as www.starwarsccg.org"
  type        = string
} ## variable

variable "redirect_target" {
  description = "Redirect target, such as: https://www.starwarsccg.org/"
  type        = string
} ## variable









