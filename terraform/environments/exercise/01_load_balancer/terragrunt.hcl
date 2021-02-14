terraform {
  source = "../../..//modules/load_balancer"
}

dependency "vpc" {
  config_path = "../00_network/00_vpc"
  mock_outputs = {
    vpc_id = "mocked_vpc_id"
  }
}

dependency "public_subnets" {
  config_path = "../00_network/01_subnet_public"
  mock_outputs = {
    subnets_ids = ["mocked_public_id_1", "mocked_public_id_2"]
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  app_name          = "httpbin"
  public_subnet_ids = dependency.public_subnets.outputs.subnets_ids
  vpc_id            = dependency.vpc.outputs.vpc_id
}
