resource "aws_subnet" "exercise_2_subnet" {
  cidr_block        = var.subnet_cidr
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}