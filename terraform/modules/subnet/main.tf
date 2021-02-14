locals {
  subnets_count = length(var.subnets_cidr_block)
}

resource "aws_subnet" "main" {
  count             = local.subnets_count
  cidr_block        = var.subnets_cidr_block[count.index]
  vpc_id            = var.vpc_id
  availability_zone = data.aws_availability_zones.main.names[count.index]

  tags = var.custom_tags
}