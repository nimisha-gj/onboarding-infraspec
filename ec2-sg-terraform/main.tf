module "exercise2_vpc" {
  source = "./modules/vpc"
  aws_vpc_cidr = local.vpc_cidr
  aws_vpc_name = local.vpc_name
}

module "public_subnet" {
  source = "./modules/subnet"
  availability_zone = local.subnet_availability_zone
  subnet_cidr = local.public_subnet_cidr
  vpc_id = module.exercise2_vpc.vpc_id
  subnet_name = local.public_subnet_name
}

module "private_subnet" {
  source = "./modules/subnet"
  availability_zone = local.subnet_availability_zone
  subnet_cidr = local.private_subnet_cidr
  vpc_id= module.exercise2_vpc.vpc_id
  subnet_name = local.private_subnet_name
}

module "public_route_table" {
  source = "./modules/rt"
  vpc_id = module.exercise2_vpc.vpc_id
  rt_name = local.public_route_table_name
  subnet_id = module.public_subnet.subnet_id
}

module "private_route_table" {
  source = "./modules/rt"
  vpc_id = module.exercise2_vpc.vpc_id
  rt_name = local.private_route_table_name
  subnet_id = module.private_subnet.subnet_id
}

module "internet_gateway" {
  source = "./modules/igw"
  vpc_id = module.exercise2_vpc.vpc_id
  igw_name = local.internet_gateway_name
}

module "ssh_sg" {
  source = "./modules/sg/ssh"
  sg_name = local.ssh_sg_name
  vpc_id = module.exercise2_vpc.vpc_id
}

module "nat_traffic_sg" {
  source = "./modules/sg/nat-traffic"
  sg_name = local.nat_traffic_sg_name
  vpc_id = module.exercise2_vpc.vpc_id
}

module "private_ec2" {
  source = "./modules/ec2"
  user_data_template_path = local.private_instance_userData_filePath
  aws_ami_id = local.ami_id
  aws_instance_name = local.private_instance_name
  aws_instance_type = local.instance_type
  aws_subnet_id = module.private_subnet.subnet_id
  aws_sg_ids = [module.ssh_sg.sg_id]
  aws_key_name = local.ssh_key_name
  source_dest_check = true
  associate_public_ip_address = false
  depends_on = [ module.private_subnet ]
}

module "nat_ec2" {
  source = "./modules/ec2"
  user_data_template_path =local.nat_instance_userData_filePath
  aws_ami_id = local.ami_id
  aws_instance_name = local.nat_instance_name
  aws_instance_type = local.instance_type
  aws_subnet_id = module.public_subnet.subnet_id
  aws_sg_ids = [module.ssh_sg.sg_id,module.nat_traffic_sg.sg_id]
  aws_key_name = local.ssh_key_name
  source_dest_check = false
  associate_public_ip_address = true
  depends_on = [ module.public_subnet ]
}

module "exercise2_routes" {
  source = "./modules/routes"
  igw_id = module.internet_gateway.igw_id
  network_interface_id = module.nat_ec2.network_interface_id
  public_rt_id = module.public_route_table.rt_id
  private_rt_id = module.private_route_table.rt_id  

  depends_on = [ module.nat_ec2,module.private_ec2 ]
}