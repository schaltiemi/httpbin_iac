output "lb_dns_name" {
  description = "Load balancer's DNS name"
  value       = aws_lb.main.dns_name
}

output "http_target_group_arn" {
  description = "Http target group ARN"
  value       = aws_lb_target_group.http.arn
}

output "load_balancer_sg_id" {
  description = "Load balancer security group's id"
  value       = aws_security_group.main.id
}