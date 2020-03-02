
resource "aws_security_group" "web" {

  name        = "web"
  description = "Web Server"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL Out"
  } ## egress



  ##
  ## HTTP (80 / 443)
  ##
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP (tcp:80)"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP (tcp:443)"
  }


  ##
  ## SSH, restrict by originating IP
  ##
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["98.11.9.47/32"]
    description = "Devon Hubner"
  }

} ## resource aws_security_group web






resource "aws_security_group" "web_alb" {

  name        = "web-alb"
  description = "Web ALB"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL Out"
  } ## egress



  ##
  ## HTTP (80 / 443)
  ##
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP (tcp:80)"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP (tcp:443)"
  }

} ## resource aws_security_group web



