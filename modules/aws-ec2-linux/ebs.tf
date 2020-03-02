

resource "aws_ebs_volume" "additional" {

  count = var.additional_ebs_volume_size == 0 ? 0 : 1

  availability_zone = aws_instance.instance.availability_zone
  size              = var.additional_ebs_volume_size
  encrypted         = true

  tags = {
    Name        = "${local.hostname}"
    Environment = var.env_name
    Application = var.app_name
    Region      = local.aws_region_nodashes
    Purpose     = "Additional EBS Volume xvdf"
  }
}


resource "aws_volume_attachment" "additional" {

  count = var.additional_ebs_volume_size == 0 ? 0 : 1

  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.additional[0].id
  instance_id = aws_instance.instance.id
}


