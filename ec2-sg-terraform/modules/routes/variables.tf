variable "igw_id" {
  description = "Internet Gateway Id which is added to the route table"
  type = string
}

variable "network_interface_id" {
  description = "Network Interface Id of the NAT instance"
  type = string
}

variable "public_rt_id" {
  description = "Id of Public route table"
  type = string
}

variable "private_rt_id" {
  description = "Id of Private route table"
  type = string
}