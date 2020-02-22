
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
