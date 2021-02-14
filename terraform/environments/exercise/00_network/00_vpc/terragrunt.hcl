terraform {
  source = "../../../..//modules/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cidr_block = "10.0.0.0/24"
}

