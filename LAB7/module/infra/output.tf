output "vpc_id" {
  value       = aws_vpc.main.id
  description = "outputs the ID of VPC"
}

output "public_subnet1_id" {
  value       = aws_subnet.pub_subnet1.id
  description = "ID of public subnet 1"
}

output "public_subnet2_id" {
  value       = aws_subnet.pub_subnet2.id
  description = "ID of public subnet 2"
}

output "private_subnet1_id" {
  value       = aws_subnet.pvt_subnet1.id
  description = "ID of private subnet 1"
}

output "private_subnet2_id" {
  value       = aws_subnet.pvt_subnet2.id
  description = "ID of private subnet 2"
}

output "igw_id" {
    value = aws_internet_gateway.main.id
    description = "internet gateway ID"
}

output "rtb_igw_id" {
  value = aws_route_table.igw_route.id
}
