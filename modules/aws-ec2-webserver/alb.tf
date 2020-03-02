
##
## [listener] --> [alb] --> [target-group]
##


resource "aws_lb" "this" {
  name               = local.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_alb.id]
  subnets            = var.alb_subnets

  enable_deletion_protection = true

  #access_logs {
  #  bucket  = "${aws_s3_bucket.lb_logs.bucket}"
  #  prefix  = "test-lb"
  #  enabled = true
  #}

  tags = {
    Environment = "production"
  }

} ## resource aws_lb this




resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    } ## redirect
  } ## default_action

} ## resource.aws_lb_listener.this


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.acm_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  } ## default_action

} ## resource.aws_lb_listener.this



resource "aws_lb_target_group" "this" {
  port     = 443
  protocol = "HTTPS"
  name     = local.alb_tg_name
  vpc_id   = var.vpc_id

  stickiness {
    type    = "lb_cookie"
    enabled = false
  }

  health_check {
    protocol = var.alb_tg_health_protocol
    port     = var.alb_tg_health_port
  }
}

resource "aws_lb_target_group_attachment" "this" {
  ## The ARN of the target group with which to register targets 
  target_group_arn = aws_lb_target_group.this.arn
  ## The ID of the target. This is the Instance ID for an instance, 
  ## or the container ID for an ECS container.
  ## If the target type is ip, specify an IP address.
  ## If the target type is lambda, specify the arn of lambda. 
  target_id        = module.aws_ec2_linux_web.instance_id
  ## The port on which targets receive traffic.
  port             = 443
}



