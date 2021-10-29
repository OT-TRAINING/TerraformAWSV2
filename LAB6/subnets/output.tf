output "pub_subnet1_id" {
      value = "${aws_subnet.pub_subnet1.id}"
}

output "pub_subnet2_id" {
      value = "${aws_subnet.pub_subnet2.id}"
}

output "pvt_subnet1_id" {
      value = "${aws_subnet.pvt_subnet1.id}"
}

output "pvt_subnet2_id" {
      value = "${aws_subnet.pvt_subnet2.id}"
}

output "igw_route_id" {
      value = "${aws_route_table.igw_route.id}"
}
