module "ec2" {
  source = "./modules/ec2"
  aws_ami_id = local.ami_id
  aws_instance_name = local.instance_name
  aws_instance_type = local.instance_type
}
