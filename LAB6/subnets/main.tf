
resource "aws_subnet" "pub_subnet1" {
  vpc_id                  = data.terraform_remote_state.vpc_igw.outputs.vpc_id
  cidr_block              = var.cidr_pub_subnet_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id                  = data.terraform_remote_state.vpc_igw.outputs.vpc_id
  cidr_block              = var.cidr_pub_subnet_2
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "pvt_subnet1" {
  vpc_id                  = data.terraform_remote_state.vpc_igw.outputs.vpc_id
  cidr_block              = var.cidr_private_subnet_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-subnet-1"
  }
}

resource "aws_subnet" "pvt_subnet2" {
  vpc_id                  = data.terraform_remote_state.vpc_igw.outputs.vpc_id
  cidr_block              = var.cidr_private_subnet_2
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-subnet-2"
  }
}

# Creating Route table
resource "aws_route_table" "igw_route" {
  vpc_id = data.terraform_remote_state.vpc_igw.outputs.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.vpc_igw.outputs.internet_gateway_id
  }
  tags = {
    Name = "test-route-table"
  }
}

# Route table association
resource "aws_main_route_table_association" "rtb_association" {
  vpc_id         = data.terraform_remote_state.vpc_igw.outputs.vpc_id
  route_table_id = aws_route_table.igw_route.id
}