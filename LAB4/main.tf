provider "aws" {
  region = "us-east-1"
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "test-igw"
  }
}
#  create VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "pub_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "pvt_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-subnet-1"
  }
}

resource "aws_subnet" "pvt_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-subnet-2"
  }
}

resource "aws_instance" "main" {
  ami           = "ami-082d645d7cbf18b97"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id     = aws_subnet.pub_subnet1.id
  tags = {
    Name = "test-ec2-instance"
  }
}

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

resource "aws_main_route_table_association" "rtb_association" {
  vpc_id = aws_vpc.main.id
  route_table_id = aws_route_table.igw_route.id
}
