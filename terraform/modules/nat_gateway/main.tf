resource "aws_eip" "nat_gateway" {
  count = length(var.public_subnet_ids)
  vpc   = true
}

resource "aws_nat_gateway" "gw" {
  count         = length(var.public_subnet_ids)
  allocation_id = aws_eip.nat_gateway[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]
  tags          = var.custom_tags
}

resource "aws_route_table" "private" {
  count  = length(var.public_subnet_ids)
  vpc_id = var.vpc_id
  tags   = var.custom_tags
}

resource "aws_route_table_association" "private_subnet_access" {
  count          = length(var.private_subnet_ids)
  route_table_id = aws_route_table.private[count.index].id
  subnet_id      = var.private_subnet_ids[count.index]
}

resource "aws_route" "nat_gw" {
  count                  = length(var.public_subnet_ids)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.gw[count.index].id
}