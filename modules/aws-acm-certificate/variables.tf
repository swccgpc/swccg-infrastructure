
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
} ## variable aws_region

variable "aws_profile" {
  description = "AWS Profile"
  type        = string
} ## variable aws_profile

##########################################

variable "domain_name" {
  description = "Domain Name, such as starwarsccg.org"
  type        = string
}

variable "alt_domains" {
  description = "Alternate Domain Names, such as www.starwarsccg.org"
  type        = list
  default     = []
}

variable "env_name" {
  description = "VPC Name"
  type        = string
}
