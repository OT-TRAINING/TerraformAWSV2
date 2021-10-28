provider "aws" {
region ="us-east"
}

#  create VPC
resource "aws_vpc" "main" {
  cir_block  =    "10.0.0.0/16"
instance_tenancy = "default"
  tags = {
    Name = "test-vpc"
  }
}

# create public subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
 cidr_block              =   "10.0.1.0/24"
 map_public_ip_on_launch = true
  tags = {
    Name = "test-subnet"
  }
}

# create ec-2
resource "aws_instance" "main" {
  ami           = "ami-09e67e426f25ce0d7"
  count = 1
 instance_type = "t2.micro"
subnet_id     = aws_subnet.main.id
  tags = {
    Name = "test-instance"
  }
}

