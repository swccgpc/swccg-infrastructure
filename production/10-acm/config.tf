
terraform {
  backend "s3" {
    ## note: can not have variables in the backend declaration
    bucket         = "useast2-swccg-tfstate-prod"
    region         = "us-east-2"
    key            = "10-acm/terraform.tfstate"
    dynamodb_table = "useast2-swccg-tflock-prod"
    encrypt        = true
    profile        = "swccg-production"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

provider "aws" {
  alias   = "use1"
  region  = "us-east-1" # var.aws_region
  profile = var.aws_profile
}

provider "aws" {
  alias   = "use2"
  region  = "us-east-2" # var.aws_region
  profile = var.aws_profile
}