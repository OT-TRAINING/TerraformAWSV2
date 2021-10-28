output "vpc_id" {
  value       = aws_vpc.main.id
  description = "outputs the ID of VPC"
}

output "ec2_public_ip" {
  value       = aws_instance.main.public_ip
  description = "outputs the public IP of ec2 instance"
}