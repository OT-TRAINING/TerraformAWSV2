# For VPC
variable "cidr_block_vpc" {
    default = "10.0.0.0/16"
}

variable "instance_tenancy_vpc" {
    default = "default"
}

variable "Name_vpc" {
    default = "test-vpc"
}

# For SUBNET

variable "cidr_subnet" {
    default = "10.0.1.0/24"
}

variable "public_ip_on_launch" {
    default = true
}

variable "name_subnet" {
    default = "test-subnet"
}

#for EC2

variable "ami_ec2" {
    default = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "Name_ec2" {
    default = "test-instance"
}
