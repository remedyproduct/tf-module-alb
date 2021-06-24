resource "aws_security_group" "main" {
  name   = substr(format("%s-%s-%s", var.name, var.environment, "sg"), 0, 32)
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = substr(format("%s-%s-%s", var.name, var.environment, "sg"), 0, 32)
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"

  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "allow_https" {
  type = "ingress"

  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.main.id
}
