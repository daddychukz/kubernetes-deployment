# ---------------Subnets----------------

resource "aws_subnet" "k8s_subnet" {
  vpc_id                  = "${aws_vpc.k8s_vpc.id}"
  cidr_block              = "${var.cidrs["public1"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "kub_subnet"
  }
}

# Subnet Associations

resource "aws_route_table_association" "kub_subnet_assoc" {
  subnet_id      = "${aws_subnet.k8s_subnet.id}"
  route_table_id = "${aws_route_table.k8s_public_rt.id}"
}
