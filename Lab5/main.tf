provider "aws" {
  region = "us-east-1"
}

#  create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = "default"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "pub_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_pub_subnet_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_pub_subnet_2
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "pvt_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_private_subnet_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-subnet-1"
  }
}

resource "aws_subnet" "pvt_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_private_subnet_2
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-subnet-2"
  }
}

# Creating EC2 Instance
resource "aws_instance" "main" {
  ami                         = "ami-082d645d7cbf18b97"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.pub_subnet1.id
  tags = {
    Name = "test-ec2-instance"
  }
}

# Creating IGW 
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "test-igw"
  }
}

# Creating SG
resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  name   = "main Security Group"

  # allow ingress of port 80
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "test-SG"
  }
}

# Creating Route table
resource "aws_route_table" "igw_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "test-route-table"
  }
}

# Route table association
resource "aws_main_route_table_association" "rtb_association" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.igw_route.id
}
