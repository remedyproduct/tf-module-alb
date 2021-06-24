resource "aws_lb" "main" {
  name               = substr(format("%s-%s-%s", var.name, var.environment, "lb"), 0, 32)
  internal           = !var.public
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
  }
}
