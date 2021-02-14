terraform {
  source = "../../../..//modules/subnet"
}

dependency "vpc" {
  config_path = "../00_vpc"
  mock_outputs = {
    vpc_id = "mocked_vpc_id"
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_id             = dependency.vpc.outputs.vpc_id
  subnets_cidr_block = ["10.0.0.0/26", "10.0.0.64/26"]
}

