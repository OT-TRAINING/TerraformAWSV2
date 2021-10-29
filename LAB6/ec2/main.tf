# Creating EC2 Instance
resource "aws_instance" "main" {
  ami                         = "ami-082d645d7cbf18b97"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.terraform_remote_state.vpc_igw.outputs.security_group_id]
  subnet_id                   = data.terraform_remote_state.subnets.outputs.pub_subnet1_id
  tags = {
    Name = "test-ec2-instance"
  }
}

