

output "instance_id" {
  description = "EC2 Instance ID"
  value       = module.aws_ec2_linux_web.instance_id
}

output "instance_ami" {
  description = "EC2 Instance AMI"
  value       = module.aws_ec2_linux_web.instance_ami
}

output "instance_private_ip" {
  description = "EC2 Instance Private IP"
  value       = module.aws_ec2_linux_web.instance_private_ip
}

output "instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = module.aws_ec2_linux_web.instance_public_ip
}

output "security_group_web_id" {
  description = "Web Security Group ID"
  value       = aws_security_group.web.id
}

output "security_group_web_arn" {
  description = "Web Security Group arn"
  value       = aws_security_group.web.arn
}


output "aws_lb_arn" {
  description = "aws_lb arn"
  value       = aws_lb.this.arn
} ## output aws_lb_arn

output "aws_lb_dns_name" {
  description = "aws_lb dns_name"
  value       = aws_lb.this.dns_name
} ## output aws_lb_dns_name

output "aws_lb_zone_id" {
  description = "aws_lb zone_id"
  value       = aws_lb.this.zone_id
} ## output aws_lb_zone_id




