resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.environment}-${var.igw_name}"
  }
}
#  create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "pub_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_sub1_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-${var.pub_subnet1_name}"
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_sub2_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-${var.pub_subnet2_name}"
  }
}

resource "aws_subnet" "pvt_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pvt_sub1_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-${var.pvt_subnet1_name}"
  }
}

resource "aws_subnet" "pvt_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pvt_sub2_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-${var.pvt_subnet2_name}"
  }
}

resource "aws_instance" "main" {
  ami            = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id     = aws_subnet.pub_subnet1.id
  tags = {
    Name = "${var.environment}-${var.instance_name}"
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
    Name = "${var.environment}-${var.sg_name}"
  }
}

resource "aws_route_table" "igw_route" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id
    }
  tags = {
    Name = "${var.environment}-${var.rtb_igw_name}"
  }
}

resource "aws_main_route_table_association" "rtb_association" {
  vpc_id = aws_vpc.main.id
  route_table_id = aws_route_table.igw_route.id
}