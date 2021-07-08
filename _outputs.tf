output "http_listener" {
  value = aws_lb_listener.http.arn
}

output "https_listener" {
  value = length(aws_lb_listener.https) > 0 ? aws_lb_listener.https[0] : null
}

output "alb_security_group" {
  value = = aws_security_group.main
}

output "dns_name" {
  value = aws_lb.main.dns_name
}

output "zone_id" {
  value = aws_lb.main.zone_id
}
