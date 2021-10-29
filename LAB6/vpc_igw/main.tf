#  create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = "default"
  tags = {
    Name = "test-vpc"
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
