terraform {
  required_providers {

  }
}

data "aws_ami" "linux_ami" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
  tags = {
    name = var.instance_name
  }
}

resource "aws_instance" "aws-vm" {
  ami           = data.aws_ami.linux_ami.id
  instance_type = var.instance
  count = var.ec2_count
  tags = {
    name = var.instance_name
  }
}

resource "aws_instance" "us-vm" {
  tags = {
    name = var.instance_name
  }
  ami = data.aws_ami.linux_ami.id
  instance_type = var.instance
  count = var.ec2_count
}