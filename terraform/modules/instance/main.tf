resource "aws_launch_configuration" "main" {
  associate_public_ip_address = false
  image_id                    = data.aws_ami.image.image_id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.main.id]
  root_block_device {
    encrypted = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "main" {
  name                 = var.instance_name
  desired_capacity     = var.app_desired_capacity
  launch_configuration = aws_launch_configuration.main.name
  max_size             = var.max_autoscaling_group_size
  min_size             = var.min_autoscaling_group_size
  vpc_zone_identifier  = var.private_subnet_ids
  target_group_arns    = [var.http_target_group_arn]
  health_check_type    = "ELB"
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_policy" "main" {
  name                      = "${var.instance_name}_autoscaling_policy"
  policy_type               = "TargetTrackingScaling"
  adjustment_type           = "ChangeInCapacity"
  autoscaling_group_name    = aws_autoscaling_group.main.name
  estimated_instance_warmup = 300
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 80
  }
}