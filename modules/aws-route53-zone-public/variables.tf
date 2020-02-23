
variable "zone_name" {
  description = "Route53 Zone Name"
  type        = string
  default     = "noname"
} ## variable zone_name

variable "dns_entries" {
  type = list(object({
    name    = string
    type    = string
    ttl     = string
    records = list(string)
  }))
} ## variable dns_entries


