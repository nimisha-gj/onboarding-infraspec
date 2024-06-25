## Providers
|Name|Version|
|---|--|
|aws|5.55.0|

## Resources

| Name | Type |
|------|------|
| [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource|
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource|
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource|
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource|
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource|
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource|
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource|
| [aws_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource|


## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| AMI Id | Id of the AMI for the EC2 instance | `string` | n/a | yes 
| instance_type | Type of the EC2 instance | `string` | n/a | yes |
| instance_name | Name of the EC2 instance | `string` | n/a | yes |
| user | Name of the User creating the instance | `string` | n/a | yes |
| region | regoin where the instance is to be created | `string` | n/a | yes |
| ssh_key_name | Name of the ssh key which can to used to connect to instance | `string` | n/a | yes |
| vpc_cidr | CIDR block for the VPC | `string` | n/a | yes |
| private_subnet_cidr | CIDR block for the private subnet | `string` | n/a | yes |
| public_subnet_cidr | CIDR block for the public subnet | `string` | n/a | yes |
| nat_instance_userData_filePath | Path of the user data templete file for NAT instance | `string` | n/a | yes |
| private_instance_userData_filePath | Path of the user data templete file for private EC2 instance | `string` | n/a | yes |
| nat_instance_name | Name of the NAT instance | `string` | n/a | yes |
| private_instance_name | Name of the private EC2 instance | `string` | n/a | yes |
| private_subnet_name | Name of the Private subnet | `string` | n/a | yes |
| public_subnet_name | Name of the Public subnet | `string` | n/a | yes |
| subnet_availability_zone | Availability zone for the subnet | `string` | n/a | yes |
| vpc_name | Name of the VPC | `string` | n/a | yes |
| public_route_table_name | Name of the public route table | `string` | n/a | yes |
| private_route_table_name | Name of the private route table | `string` | n/a | yes |
| nat_traffic_sg_name | Name of the security group for NAT instance | `string` | n/a | yes |
| ssh_sg_name | Name of the security group which allows SSH connections | `string` | n/a | yes |
| internet_gateway_name | Name of the internet gateway | `string`| n/a | yes |
