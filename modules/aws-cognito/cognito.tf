


##
## A user pool is a user directory in Amazon Cognito.
## With a user pool, your users can sign in to your web or mobile app through Amazon Cognito.
##
resource "aws_cognito_user_pool" "this" {
  name                = var.namespace
  alias_attributes    = ["email", "preferred_username"]

  auto_verified_attributes = ["email"]

  admin_create_user_config {
    allow_admin_create_user_only = false
    invite_message_template {
      email_message = "Your SWCCG username is {username} and temporary password is {####}. "
      email_subject = "Your SWCCG temporary password"
      sms_message   = "Your SWCCG username is {username} and temporary password is {####}. "
    }
  } ## admin_create_user_config

  password_policy {
    minimum_length                   = 12
    require_uppercase                = true
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    temporary_password_validity_days = 1
  } ## password_policy


  # attribute_data_type: Must be one of Boolean, Number, String, DateTime.
  # mutable............: Specifies whether the attribute can be changed once it has been created.

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    } ## string_attribute_constraints

  } ## schema email

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "family_name"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    } ## string_attribute_constraints

  } ## schema family_name

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "given_name"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    } ## string_attribute_constraints

  } ## schema given_name

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "name"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    } ## string_attribute_constraints

  } ## schema name

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "nickname"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    } ## string_attribute_constraints

  } ## schema nickname


  #lambda_config {
  #  pre_sign_up = aws_lambda_function.this.arn
  #}

  device_configuration {
    challenge_required_on_new_device      = false
    device_only_remembered_on_user_prompt = false
  }


  email_configuration {
    email_sending_account  = var.email_sending_account
    from_email_address     = var.email_from_email_address
    reply_to_email_address = var.email_reply_to_email_address
    source_arn             = var.email_source_arn
  }

  username_configuration {
    case_sensitive = false
  }

  verification_message_template {
    default_email_option  = "CONFIRM_WITH_CODE"
    email_message         = "Your SWCCG verification code is {####}. "
    email_subject         = "Your SWCCG verification code"
    sms_message           = "Your SWCCG verification code is {####}. "
  }


  tags = {
    Name        = var.namespace
    Environment = var.env_name
    Application = var.app_name
    Region      = local.aws_region_nodashes
  }

} ## resource aws_cognito_user_pool this


#resource "aws_cognito_user_pool_client" "this" {
#  name            = var.namespace
#  user_pool_id    = aws_cognito_user_pool.this.id
#  generate_secret = false
#
#  explicit_auth_flows = ["ADMIN_NO_SRP_AUTH",
#                         "USER_PASSWORD_AUTH",
#                        ]
#} ## resource aws_cognito_user_pool_client this


