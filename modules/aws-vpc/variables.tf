variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "number_of_azs" {
  description = "Number of AZs to provision"
  type        = number
  default     = 4
}

###################################

variable "ip_first_two_bits" {
  description = "First two bits of VPC Network Range"
  type        = string
  default     = "192.168"
}

variable "env_name" {
  description = "VPC Name"
  type        = string
  default     = "noname"
}

variable "aws_vpc_gateway_endpoints" {
  description = "AWS VPC GATEWAY Endpoints"
  type        = list
  default     = ["s3"]
} ## variable aws_vpc_gateway_endpoints

##
## VPC Endpoints cost $0.01 per Hour.
## Only enable VPC endpoints you need.
## It can be cheaper to use VPC endpoints than
## the external data transfer costs.
##
variable "aws_vpc_interface_endpoints" {
  description = "AWS VPC INTERFACE Endpoints"
  type        = list
  default     = [
    #"appmesh-envoy-management",
    #"cloudtrail",
    #"ec2",
    #"ec2messages",
    #"ecs",                  # ECS
    #"ecs-agent",            # ECS Agent
    #"ecs-telemetry",        # ECS Telemetry
    #"ecr.api",              # ECR
    #"ecr.dkr",              # ECR
    #"elasticloadbalancing", # ELB API
    #"events",               # Cloudwatch Events
    #"execute-api",          # API Gateway
    #"glue",
    #"kms",
    #"logs",                 # Cloudwatch Logs
    #"monitoring",           # Cloudwatch
    #"sqs",
    #"ssm",
    #"ssmmessages",
    #"transfer.server",      # AWS Transfer for SFTP
  ]
} ## variable aws_vpc_interface_endpoints

###################################

locals {

  vpc_cidr = "${var.ip_first_two_bits}.0.0/16"

  vpc_subnet_dmz1_cidr = "${var.ip_first_two_bits}.11.0/24"
  vpc_subnet_dmz2_cidr = "${var.ip_first_two_bits}.22.0/24"
  vpc_subnet_dmz3_cidr = "${var.ip_first_two_bits}.33.0/24"
  vpc_subnet_dmz4_cidr = "${var.ip_first_two_bits}.44.0/24"
  vpc_subnet_dmz5_cidr = "${var.ip_first_two_bits}.55.0/24"
  vpc_subnet_dmz6_cidr = "${var.ip_first_two_bits}.66.0/24"

  vpc_subnet_trust1_cidr = "${var.ip_first_two_bits}.111.0/24"
  vpc_subnet_trust2_cidr = "${var.ip_first_two_bits}.122.0/24"
  vpc_subnet_trust3_cidr = "${var.ip_first_two_bits}.133.0/24"
  vpc_subnet_trust4_cidr = "${var.ip_first_two_bits}.144.0/24"
  vpc_subnet_trust5_cidr = "${var.ip_first_two_bits}.155.0/24"
  vpc_subnet_trust6_cidr = "${var.ip_first_two_bits}.166.0/24"

  vpc_subnet_bidb1_cidr = "${var.ip_first_two_bits}.91.0/24"
  vpc_subnet_bidb2_cidr = "${var.ip_first_two_bits}.92.0/24"
  vpc_subnet_bidb3_cidr = "${var.ip_first_two_bits}.93.0/24"
  vpc_subnet_bidb4_cidr = "${var.ip_first_two_bits}.94.0/24"
  vpc_subnet_bidb5_cidr = "${var.ip_first_two_bits}.95.0/24"
  vpc_subnet_bidb6_cidr = "${var.ip_first_two_bits}.96.0/24"

  vpc_subnet_db1_cidr = "${var.ip_first_two_bits}.81.0/24"
  vpc_subnet_db2_cidr = "${var.ip_first_two_bits}.82.0/24"
  vpc_subnet_db3_cidr = "${var.ip_first_two_bits}.83.0/24"
  vpc_subnet_db4_cidr = "${var.ip_first_two_bits}.84.0/24"
  vpc_subnet_db5_cidr = "${var.ip_first_two_bits}.85.0/24"
  vpc_subnet_db6_cidr = "${var.ip_first_two_bits}.86.0/24"


  vpc_nat1_ip = "${var.ip_first_two_bits}.11.10"
  vpc_nat2_ip = "${var.ip_first_two_bits}.21.10"
  vpc_nat3_ip = "${var.ip_first_two_bits}.33.10"
  vpc_nat4_ip = "${var.ip_first_two_bits}.44.10"
  vpc_nat5_ip = "${var.ip_first_two_bits}.55.10"
  vpc_nat6_ip = "${var.ip_first_two_bits}.66.10"

  vpc_az1 = "${var.aws_region}a"
  vpc_az2 = "${var.aws_region}b"
  vpc_az3 = "${var.aws_region}c"
  vpc_az4 = "${var.aws_region}d"
  vpc_az5 = "${var.aws_region}e"
  vpc_az6 = "${var.aws_region}f"

  vpc_subnets_dmz   = [ local.vpc_subnet_dmz1_cidr,   local.vpc_subnet_dmz2_cidr,   local.vpc_subnet_dmz3_cidr,   local.vpc_subnet_dmz4_cidr,   local.vpc_subnet_dmz5_cidr,   local.vpc_subnet_dmz6_cidr ]
  vpc_subnets_trust = [ local.vpc_subnet_trust1_cidr, local.vpc_subnet_trust2_cidr, local.vpc_subnet_trust3_cidr, local.vpc_subnet_trust4_cidr, local.vpc_subnet_trust5_cidr, local.vpc_subnet_trust6_cidr ]
  vpc_subnets_bidb  = [ local.vpc_subnet_bidb1_cidr,  local.vpc_subnet_bidb2_cidr,  local.vpc_subnet_bidb3_cidr,  local.vpc_subnet_bidb4_cidr,  local.vpc_subnet_bidb5_cidr,  local.vpc_subnet_bidb6_cidr ]
  vpc_subnets_db    = [ local.vpc_subnet_db1_cidr,    local.vpc_subnet_db2_cidr,    local.vpc_subnet_db3_cidr,    local.vpc_subnet_db4_cidr,    local.vpc_subnet_db5_cidr,    local.vpc_subnet_db6_cidr ]

  vpc_nats = [ local.vpc_nat1_ip, local.vpc_nat2_ip, local.vpc_nat3_ip, local.vpc_nat4_ip, local.vpc_nat5_ip, local.vpc_nat6_ip ]
  vpc_azs  = [ local.vpc_az1, local.vpc_az2, local.vpc_az3, local.vpc_az4, local.vpc_az5, local.vpc_az6 ]


} ## locals



