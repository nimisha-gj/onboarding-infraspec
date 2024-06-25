variable "vpc_id" {
  description = "VPC id where the internet gateway it to attached"
  type = string
}
variable "igw_name" {
  description = "Name of the Internet Gateway"
  type = string
}