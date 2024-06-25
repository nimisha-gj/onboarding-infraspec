locals {
  region = "ap-south-1"
  user = "nimisha"
  ssh_key_name = "nimisha-exercise"
  instance_type = "t2.micro"
  nat_traffic_sg_name = "nat_traffic_sg"
  ssh_sg_name = "SSH_sg"
  internet_gateway_name = "public_internet_gateway"
  private_route_table_name = "private_route_table"
  public_route_table_name = "public_route_table"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "exercise_2_vpc"
  subnet_availability_zone = "ap-south-1a"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  public_subnet_name = "public_subnet"
  private_subnet_name = "private_subnet"
  ami_id = "ami-0e1d06225679bc1c5"
  private_instance_name = "private_ec2"
  nat_instance_name = "nat_ec2"
  private_instance_userData_filePath = "${path.module}/templates/private_ec2_userData.tpl"
  nat_instance_userData_filePath =  "${path.module}/templates/nat_ec2_userData.tpl"
}