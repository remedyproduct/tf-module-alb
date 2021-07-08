resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = 80
  protocol          = "HTTP"

  dynamic "default_action" {
    for_each = var.https_only ? [1] : []
    content {
      type = "redirect"

      redirect {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  }

  dynamic "default_action" {
    for_each = var.https_only ? [] : [1]
    content {
      type = "fixed-response"

      fixed_response {
        content_type = "text/plain"
        message_body = format("I'm a teapot (%s)", substr(format("%s-%s-%s", var.name, var.environment, "lb"), 0, 32))
        status_code  = "418"
      }
    }
  }
}

resource "aws_lb_listener" "https" {
  count = var.acm_certificate_arn != null ? 1 : 0

  load_balancer_arn = aws_lb.main.id
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = format("I'm a teapot (%s)", substr(format("%s-%s-%s", var.name, var.environment, "lb"), 0, 32))
      status_code  = "418"
    }
  }
}
