provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "amazon_linux_instance" {
  ami           = "ami-0e1d06225679bc1c5"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-exercise-1"
  }
}
