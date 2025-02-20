variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type = string
}

variable "subnet_name" {
  description = "Subnet Name used in Tags"
  type = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type = string
}

variable "vpc_id" {
  description = "ID of vpc where the subnet is to be created"
  type = string
}