

#data "template_file" "cognito_iam_assume_role_policy" {
#  template = file("${path.module}/iam/policies/assume-role/cognito-identity.json")
#
#  vars = {
#    cognito_identity_pool_id = aws_cognito_identity_pool.this.id
#  } ## vars
#
#} ## data template_file cognito_iam_assume_role_policy
#
#
#resource "aws_iam_role" "cognito_sms" {
#  name = "cognito-sms"
#
#  assume_role_policy = data.template_file.cognito_iam_assume_role_policy.rendered
#
#} ## resource aws_iam_role cognito





