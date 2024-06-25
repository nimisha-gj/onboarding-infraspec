resource "aws_instance" "exercise_2_instance" {
  ami                         = var.aws_ami_id
  instance_type               = var.aws_instance_type
  subnet_id                   = var.aws_subnet_id
  vpc_security_group_ids      = var.aws_sg_ids
  key_name                    = var.aws_key_name
  associate_public_ip_address = var.associate_public_ip_address
  source_dest_check           = var.source_dest_check
  user_data                   = data.template_file.user_data.rendered
  tags = {
    Name = var.aws_instance_name
  }
}