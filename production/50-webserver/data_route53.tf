
data "terraform_remote_state" "r53" {
  backend = "s3"

  config = {
    bucket         = "useast2-swccg-tfstate-prod"
    dynamodb_table = "useast2-swccg-tflock-prod"
    region         = "us-east-2"
    profile        = var.aws_profile
    key            = "30-route53/terraform.tfstate"
  }
}

