variable "environment" {
  type        = string
  default     = "Dev" 
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR value for VPC"
}

variable "pub_subnet1_name" {
  type        = string
  default = "Public-Subnet-1"
}

variable "pub_subnet2_name" {
  type        = string
  default = "Public-Subnet-2"
}

variable "pvt_subnet1_name" {
  type        = string
  default = "Private-Subnet-1"
}

variable "pvt_subnet2_name" {
  type        = string
  default = "Private-Subnet-2"
}

variable "pub_sub1_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR for public-subnet-1"
}

variable "pub_sub2_cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR for public-subnet-2"
}

variable "pvt_sub1_cidr" {
  type        = string
  default     = "10.0.3.0/24"
  description = "CIDR for private-subnet-1"
}

variable "pvt_sub2_cidr" {
  type        = string
  default     = "10.0.4.0/24"
  description = "CIDR for private-subnet-2"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "type of the ec2 instance"
}

variable "ami_id" {
  type        = string
  default     = "ami-082d645d7cbf18b97"
}

variable "instance_name" {
  type        = string
  default     = "vm"
}

variable "sg_name" {
  type        = string
  default     = "my-SG"  
}

variable "rtb_igw_name" {
  type        = string
  default     = "test-rtb-igw"
}

variable "igw_name" {
  type        = string
  default     = "my-igw"  
}