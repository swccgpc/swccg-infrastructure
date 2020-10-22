variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

###################################

variable "env_name" {
  description = "Environment Name"
  type        = string
  default     = "prod"
}

variable "app_name" {
  description = "App Name"
  type        = string
  default     = "all"
}

###################################

variable "namespace" {
  type        = string
  default     = "swccg"
  description = "Name of the Cognito pool"
}

variable "email_sending_account" {
  type    = string
  default = "DEVELOPER"
}

variable "email_from_email_address" {
  type    = string
  default = "store@starwarsccg.org"
}

variable "email_reply_to_email_address" {
  type    = string
  default = "store@starwarsccg.org"
}

variable "email_source_arn" {
  type    = string
  default = "arn:aws:ses:us-east-1:230787692442:identity/store@starwarsccg.org"
}

###################################

locals {
  aws_region_nodashes = replace(var.aws_region, "-", "")
}

