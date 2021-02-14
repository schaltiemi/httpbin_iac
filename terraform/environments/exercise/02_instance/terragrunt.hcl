terraform {
  source = "../../..//modules/instance"
}

dependency "vpc" {
  config_path = "../00_network/00_vpc"
  mock_outputs = {
    vpc_id = "mocked_vpc_id"
  }
}

dependency "private_subnets" {
  config_path = "../00_network/02_subnet_private"
  mock_outputs = {
    subnets_ids = ["mocked_private_id_1", "mocked_private_id_2"]
  }
}

dependency "load_balancer" {
  config_path = "../01_load_balancer"
  mock_outputs = {
    http_target_group_arn = "mocked_arn"
    load_balancer_sg_id   = "mocked_id"
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  instance_name              = "httpbin"
  app_desired_capacity       = 2
  max_autoscaling_group_size = 4
  min_autoscaling_group_size = 2
  private_subnet_ids         = dependency.private_subnets.outputs.subnets_ids
  image_id                   = "ami-0d0615d8d56a9879f"
  instance_type              = "t2.micro"
  vpc_id                     = dependency.vpc.outputs.vpc_id
  http_target_group_arn      = dependency.load_balancer.outputs.http_target_group_arn
  loab_balancer_sg_id        = dependency.load_balancer.outputs.load_balancer_sg_id
}
