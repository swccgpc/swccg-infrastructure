

module "aws_ec2_linux_web" {
  source             = "../../modules/aws-ec2-linux"
  app_name           = var.app_name
  env_name           = var.env_name
  fqdn               = var.fqdn
  instance_type      = var.instance_type
  instance_id        = var.instance_id
  cpu_credits        = var.cpu_credits
  userdata           = local.userdata
  subnet_id          = var.subnet_id
  ebs_volume_size    = var.ebs_volume_size
  associate_public_ip_address = var.associate_public_ip_address
  security_group_ids = [aws_security_group.web.id]
} ## module

