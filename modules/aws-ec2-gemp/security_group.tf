
resource "aws_security_group" "gemp_alb" {

  name        = "gemp-alb"
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
    ipv6_cidr_blocks = ["::/0"]
    description = "HTTP (tcp:80)"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description = "HTTP (tcp:443)"
  }

} ## resource aws_security_group gemp




resource "aws_security_group" "gemp" {

  name        = "gemp"
  description = "GEMP Server"
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
    ipv6_cidr_blocks = ["::/0"]
    description = "HTTP (tcp:80)"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description = "HTTP (tcp:443)"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.gemp_alb.id]
    description = "HTTP (tcp:80)"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.gemp_alb.id]
    description = "HTTP (tcp:443)"
  }

  ##
  ## SSH, restrict by originating IP
  ##
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["23.169.64.0/25", "208.54.226.144/32"]
    description = "EchoBaseTrooper"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["98.229.122.113/32"]
    description = "Apollyon"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["99.90.186.187/32", "75.86.32.98/32"]
    description = "adamanthil"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["24.126.128.12/32",
                   "107.223.192.45/32",
                   "24.98.166.167/32",
                   "73.7.11.159/32"]
    description = "Jeremy DiPaolo"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["73.24.3.207/32"]
    description = "Tom Marlin"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["72.95.222.64/32", "72.95.222.58/32"]
    description = "Justin Carulli"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["98.11.9.47/32"]
    description = "Devon Hubner"
  }

} ## resource aws_security_group gemp









resource "aws_security_group" "gemp_rds" {

  name        = "gemp-rds"
  description = "GEMP RDS"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL Out"
  } ## egress

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow ALL Out FROM SELF"
  } ## egress

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow ALL In FROM SELF"
  } ## egress

  ##
  ## MySQL (3306)
  ##
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.gemp.id]
    description = "MySQL (tcp:3306)"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.42.11.0/24"]
    description = "MySQL (tcp:3306) prod VPC"
  }

} ## resource aws_security_group gemp
