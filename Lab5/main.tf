provider "aws" {
  region = "us-east-1"
}

#  create VPC
resource "aws_vpc" "main" {
  cidr_block       =    var.cidr_block_vpc
  instance_tenancy = var.instance_tenancy_vpc
  tags = {
    Name = var.Name_vpc
  }
}

# create public subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              =   var.cidr_subnet
  map_public_ip_on_launch = var.public_ip_on_launch
  tags = {
    Name = var.name_subnet
  }
}

# create ec-2
resource "aws_instance" "main" {
  ami           = var.ami_ec2
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id
  tags = {
    Name = var.Name_ec2
  }
}

