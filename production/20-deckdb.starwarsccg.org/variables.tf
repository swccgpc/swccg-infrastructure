variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
} ## variable aws_region

variable "aws_profile" {
  description = "AWS Profile"
  type        = string
  default     = "swccg-production"
} ## variable aws_profile


##
## DeckDB RDS Settings
## Pul from terraform.tfvars
##
variable "rds_deckdb" {
  type = map(string)
  default = {
    username = "xxxxxx"
    password = "yyyyyy"
  } ## default
} ## variable rds_deckdb
