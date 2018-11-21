#internet gateway

resource "aws_internet_gateway" "k8s_internet_gateway" {
  vpc_id = "${aws_vpc.k8s_vpc.id}"

  tags {
    Name = "k8s_igw"
  }
}
