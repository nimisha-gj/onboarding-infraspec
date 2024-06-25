resource "aws_route" "private_route" {
  route_table_id         = var.private_rt_id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = var.network_interface_id
}

resource "aws_route" "public_route" {
  route_table_id         = var.public_rt_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}