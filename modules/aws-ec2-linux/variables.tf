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

###################################

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
  description = "numeric id for instance. Use for long-running instances like a bastion"
  type        = string
  default     = "default"
}

variable "associate_public_ip_address" {
  description = "Associate Public IP? (boolean)"
  type        = bool
  default     = false
}

variable "userdata" {
  description = "EC2 User Data"
  type        = string
  default     = "#cloud-config" # \nhostname: '${local.hostname}'"
}

variable "cpu_credits" {
  description = "Can be *standard* or *unlimited*. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."
  type        = string
  default     = "standard"
}


variable "ebs_volume_size" {
  description = "Size of the EBS Volume in GiBs."
  type        = number
  default     = 8
}


variable "additional_ebs_volume_size" {
  description = "Size of the Additional EBS Volume in GiBs. 0 for *do not create*."
  type        = number
  default     = 0
}


variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "list of security group ids"
  type        = list
  default     = []
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile Name"
  type        = string
  default     = ""
} ## variable iam_instance_profile


###################################

locals {
  hostname            = "${local.aws_region_nodashes}-${var.app_name}-${var.instance_id}.${var.fqdn}"
  ami_id              = data.aws_ami.ubuntu_bionic.id
# "${var.ami_id        == "default" ? data.aws_ami.ubuntu_bionic : var.ami_id}"
  instance_type       = var.instance_type 
# "${var.instance_type == "default" ? "t3a.micro" : var.instance_type}"
  instance_id         = var.instance_id 
# "${var.instance_id   == "default" ? aws_instance.instance.id : var.instance_type}"
  aws_region_nodashes = replace(var.aws_region, "-", "")
}

