variable "user_data_template_path" {
  description = "Path to the user_data template file"
  type        = string
}

variable "aws_ami_id" {
  description = "AMI ID of EC2 instance"
  type = string
}

variable "aws_instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "aws_instance_name" {
  description = "EC2 instance name"
  type = string
}

variable "aws_subnet_id" {
  description = "Subnet ID where the instance is created"
  type = string
}

variable "aws_sg_id" {
  description = "Security Group Id which allows incomming ssh connections"
  type = string
}

variable "aws_key_name" {
  description = "Name of the SSH key to be used"
  type = string
}

variable "source_dest_check" {
  description = "Enable or Disable source destination check"
  type = bool
}

variable "associate_public_ip_address" {
  description = "Associate public IP address to the instance"
  type = bool
}
