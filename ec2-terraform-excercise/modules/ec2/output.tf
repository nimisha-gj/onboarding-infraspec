output "ec2_ip" {
  description = "Public IP of the EC2 instance"
  value = aws_instance.amazon_linux_instance.public_ip
}

output "ec2_id" {
  description = "ID of EC2 instance created"
  value = aws_instance.amazon_linux_instance.id
}