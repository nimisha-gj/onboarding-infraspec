resource "aws_instance" "amazon_linux_instance" {
  ami           = var.aws_ami_id
  instance_type = var.aws_instance_type

  tags = {
    Name = var.aws_instance_name
  }
}
