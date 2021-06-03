
terraform {
  backend "s3" {
    ## note: can not have variables in the backend declaration
    bucket         = "useast2-swccg-tfstate-prod"
    region         = "us-east-2"
    key            = "20-s3-epicduel.starwarsccg.org/terraform.tfstate"
    dynamodb_table = "useast2-swccg-tflock-prod"
    encrypt        = true
    profile        = "swccg-production"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

