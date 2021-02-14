terraform {
  source = "../../../..//modules/nat_gateway"
}

dependency "vpc" {
  config_path = "../00_vpc"
  mock_outputs = {
    vpc_id = "mocked_vpc_id"
  }
}

dependency "public_subnet" {
  config_path = "../01_subnet_public"
  mock_outputs = {
    subnets_ids = ["mocked_public_id"]
  }
}

dependency "private_subnets" {
  config_path = "../02_subnet_private"
  mock_outputs = {
    subnets_ids = ["mocked_private_id_1", "mocked_private_id_2"]
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_id             = dependency.vpc.outputs.vpc_id
  public_subnet_ids  = dependency.public_subnet.outputs.subnets_ids
  private_subnet_ids = dependency.private_subnets.outputs.subnets_ids
  subnets_cidr_block = ["10.0.0.8/29", "10.0.0.16/29"]
}
