
resource "aws_dynamodb_table" "tflock" {
  name           = local.dynamodb_table_name
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  } ## attribute

  tags = {
    Name        = local.dynamodb_table_name
    Purpose     = "Terraform Locks"
    Environment = var.env_name
    Owner       = "Created by Terraform"
  } ## tags

} ## resource aws_dynamodb_table


