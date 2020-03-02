
resource "aws_security_group" "rds" {

  name        = "rds"
  description = "Database"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ALL Out"
  } ## egress

  ##
  ## Self
  ##
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow ALL In"
  } ## ingress

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow ALL Out"
  } ## egress

  ##
  ## MySQL
  ##
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.vpc_security_group_ids
    description     = "MySQL (tcp:3306)"
  }


  tags = {
    Name = "rds"
  }

} ## resource aws_security_group web





