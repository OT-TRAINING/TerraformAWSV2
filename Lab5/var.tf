# For VPC
variable "cidr_block_vpc" {
  type    = string
  default = "10.0.0.0/16"
}


# For SUBNET
variable "cidr_pub_subnet_1" {
  type    = string
  default = "10.0.1.0/24"
}

variable "cidr_pub_subnet_2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "cidr_private_subnet_1" {
  type    = string
  default = "10.0.3.0/24"
}

variable "cidr_private_subnet_2" {
  type    = string
  default = "10.0.4.0/24"
}


#for EC2
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
