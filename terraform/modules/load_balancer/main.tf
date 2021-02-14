resource "aws_lb" "main" {
  name               = var.app_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.public_subnet_ids
  ip_address_type    = "ipv4"

  tags = var.custom_tags
}

resource "aws_lb_target_group" "http" {
  name     = "${var.app_name}-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "http" {
  #checkov:skip=CKV_AWS_2:"Ensure ALB protocol is HTTPS"
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

