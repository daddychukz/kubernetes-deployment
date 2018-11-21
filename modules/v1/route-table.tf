# Route tables

resource "aws_route_table" "k8s_public_rt" {
  vpc_id = "${aws_vpc.k8s_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.k8s_internet_gateway.id}"
  }

  tags {
    Name = "k8s_public"
  }
}

resource "aws_default_route_table" "k8s_private_rt" {
  default_route_table_id = "${aws_vpc.k8s_vpc.default_route_table_id}"

  tags {
    Name = "k8s_private"
  }
}
