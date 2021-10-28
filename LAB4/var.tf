variable "igw_tag" {
  type        = string
}

variable "vpc_name" {
  type        = string
}

variable "pub_subnet1" {
  type        = string
}

variable "pub_subnet2" {
  type        = string
}

variable "pvt_subnet1" {
  type        = string
}

variable "pvt_subnet2" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "ami_id" {
  type        = string
}

variable "instance_name" {
  type        = string
}

variable "rtb_igw_tag" {
  type        = string
  description = "Tag for route table"
}
