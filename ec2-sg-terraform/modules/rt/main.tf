resource "aws_route_table" "exercise2_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.exercise2_route_table.id

  depends_on = [ aws_route_table.exercise2_route_table ]
}
