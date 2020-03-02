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
## Set these confidential variables as environment variables
## export TF_VAR_rds_username="xxxxxxxxxx"
## export TF_VAR_rds_password="xxxxxxxxxx"
## terraform plan
##

variable "rds_username" {
  description = "RDS Username"
  type        = string
}

variable "rds_password" {
  description = "RDS Password"
  type        = string
}






