resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
  name   = var.instance_name

  tags = var.custom_tags
}

resource "aws_security_group_rule" "allow_http_from_lb" {
  description              = "Allow http from load balancer"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = var.loab_balancer_sg_id
  security_group_id        = aws_security_group.main.id
}

resource "aws_security_group_rule" "internet_access" {
  description       = "Allow internet access"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}
