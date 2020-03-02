
output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.instance.id
}

output "instance_ami" {
  description = "EC2 Instance AMI"
  value       = aws_instance.instance.ami
}

output "instance_private_ip" {
  description = "EC2 Instance Private IP"
  value       = aws_instance.instance.private_ip
}

output "instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.instance.public_ip
}
