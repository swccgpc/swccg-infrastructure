
resource "aws_instance" "instance" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  iam_instance_profile   = var.iam_instance_profile

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size            = var.ebs_volume_size
  }

  user_data              = var.userdata

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  tags = {
    Name        = local.hostname
    Environment = var.env_name
    Application = var.app_name
    Region      = local.aws_region_nodashes
  }

}

