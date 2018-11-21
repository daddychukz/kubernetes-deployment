#------- Elastic IP -------------

resource "aws_eip" "controller1" {
  instance   = "${aws_instance.controller1.id}"
  vpc        = true
  depends_on = ["aws_internet_gateway.k8s_internet_gateway"]
}

resource "aws_eip" "controller2" {
  instance   = "${aws_instance.controller2.id}"
  vpc        = true
  depends_on = ["aws_internet_gateway.k8s_internet_gateway"]
}

resource "aws_eip" "worker1" {
  instance   = "${aws_instance.worker1.id}"
  vpc        = true
  depends_on = ["aws_internet_gateway.k8s_internet_gateway"]
}

resource "aws_eip" "worker2" {
  instance   = "${aws_instance.worker2.id}"
  vpc        = true
  depends_on = ["aws_internet_gateway.k8s_internet_gateway"]
}

resource "aws_eip" "nginx_lb" {
  instance   = "${aws_instance.nginx_lb.id}"
  vpc        = true
  depends_on = ["aws_internet_gateway.k8s_internet_gateway"]
}
