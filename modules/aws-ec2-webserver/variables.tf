variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

###################################

variable "env_name" {
  description = "Environment Name"
  type        = string
}

variable "app_name" {
  description = "App Name"
  type        = string
}

variable "fqdn" {
  description = "Full Domain Name"
  type        = string
}

variable "ami_id" {
  description = "EC2 Instance Source AMI ID"
  type        = string
  default     = "default"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "default"
}

variable "instance_id" {
  description = "numeric id for instance. Use for long-running instances like a pganalyze"
  type        = string
  default     = "default"
}

variable "associate_public_ip_address" {
  description = "Associate Public IP? (boolean)"
  type        = bool
  default     = true
}

variable "userdata" {
  description = "EC2 User Data"
  type        = string
  default     = "#cloud-config"
}

variable "cpu_credits" {
  description = "Can be *standard* or *unlimited*. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."
  type        = string
  default     = "standard"
}


variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}


variable "ebs_volume_size" {
  description = "Size of the EBS Volume in GiBs."
  type        = number
  default     = 30
}


####################################


variable "acm_arn" {
  description = "acm_arn"
  type        = string
} ## variable acm_arn

variable "alb_port" {
  description = "alb_port"
  type        = string
  default     = "443"
} ## variable alb_port


variable "alb_subnets" {
  description = "alb_subnets"
  type        = list
} ## variable alb_subnets


variable "alb_tg_health_port" {
  description = "alb_tg_health_port"
  type        = string
  default     = "80"
} ## variable alb_tg_health_port

variable "alb_tg_port" {
  description = "alb_tg_port"
  type        = string
  default     = "80"
} ## variable alb_tg_port


##
## Protocol is one of:
## [UDP, TCP, TCP_UDP, HTTP, HTTPS, TLS]
##
variable "alb_protocol" {
  description = "alb_protocol"
  type        = string
  default     = "HTTPS"
} ## variable alb_protocol

variable "alb_tg_health_protocol" {
  description = "alb_tg_health_protocol"
  type        = string
  default     = "HTTP"
} ## variable alb_tg_health_protocol

variable "alb_tg_protocol" {
  description = "alb_tg_protocol"
  type        = string
  default     = "HTTP"
} ## variable alb_tg_protocol



####################################

locals {
  alb_name            = "${local.aws_region_nodashes}-${var.app_name}"
  alb_tg_name         = "${local.aws_region_nodashes}-${var.app_name}"
  hostname            = "${local.aws_region_nodashes}-${var.app_name}-${var.instance_id}.${var.fqdn}"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  aws_region_nodashes = replace(var.aws_region, "-", "")
  userdata            = "${ var.userdata == "#cloud-config" ? data.template_file.userdata.rendered : var.userdata }"
}

