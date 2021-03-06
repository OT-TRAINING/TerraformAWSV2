output "vpc_id" {
    value = "${aws_vpc.main.id}"
}

output "internet_gateway_id" {
    value = "${aws_internet_gateway.main.id}"
}

output "security_group_id" {
    value = "${aws_security_group.main.id}"
}