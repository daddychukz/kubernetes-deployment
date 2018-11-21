#key pair

resource "aws_key_pair" "k8s_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "controller1" {
  instance_type = "${var.k8s_instance_type}"
  ami           = "${var.k8s_ami}"

  tags {
    Name = "k8s_controller1"
  }

  private_ip             = "10.0.0.250"
  key_name               = "${aws_key_pair.k8s_auth.id}"
  vpc_security_group_ids = ["${aws_security_group.k8s_controller_sg.id}"]
  subnet_id              = "${aws_subnet.k8s_subnet.id}"
  user_data              = "${file("/Users/andeladeveloper/Documents/kthw/modules/v1/userdata")}"

  #   provisioner "local-exec" {
  #     command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.wp_dev.id} --profile chuka && ansible-playbook -i /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/aws_hosts /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/wordpress.yml"
  #   }
}

resource "aws_instance" "controller2" {
  instance_type = "${var.k8s_instance_type}"
  ami           = "${var.k8s_ami}"

  tags {
    Name = "k8s_controller2"
  }

  private_ip             = "10.0.0.96"
  key_name               = "${aws_key_pair.k8s_auth.id}"
  vpc_security_group_ids = ["${aws_security_group.k8s_controller_sg.id}"]
  subnet_id              = "${aws_subnet.k8s_subnet.id}"
  user_data              = "${file("/Users/andeladeveloper/Documents/kthw/modules/v1/userdata")}"

  #   provisioner "local-exec" {
  #     command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.wp_dev.id} --profile chuka && ansible-playbook -i /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/aws_hosts /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/wordpress.yml"
  #   }
}

resource "aws_instance" "worker1" {
  instance_type = "${var.k8s_instance_type}"
  ami           = "${var.k8s_ami}"

  tags {
    Name = "k8s_worker1"
  }

  private_ip             = "10.0.0.236"
  key_name               = "${aws_key_pair.k8s_auth.id}"
  vpc_security_group_ids = ["${aws_security_group.k8s_worker_sg.id}"]
  subnet_id              = "${aws_subnet.k8s_subnet.id}"
  user_data              = "${file("/Users/andeladeveloper/Documents/kthw/modules/v1/userdata")}"

  #   provisioner "local-exec" {
  #     command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.wp_dev.id} --profile chuka && ansible-playbook -i /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/aws_hosts /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/wordpress.yml"
  #   }
}

resource "aws_instance" "worker2" {
  instance_type = "${var.k8s_instance_type}"
  ami           = "${var.k8s_ami}"

  tags {
    Name = "k8s_worker2"
  }

  private_ip             = "10.0.0.151"
  key_name               = "${aws_key_pair.k8s_auth.id}"
  vpc_security_group_ids = ["${aws_security_group.k8s_worker_sg.id}"]
  subnet_id              = "${aws_subnet.k8s_subnet.id}"
  user_data              = "${file("/Users/andeladeveloper/Documents/kthw/modules/v1/userdata")}"

  #   provisioner "local-exec" {
  #     command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.wp_dev.id} --profile chuka && ansible-playbook -i /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/aws_hosts /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/wordpress.yml"
  #   }
}

resource "aws_instance" "nginx_lb" {
  instance_type = "${var.k8s_instance_type}"
  ami           = "${var.k8s_ami}"

  tags {
    Name = "k8s_nginx_lb"
  }

  private_ip             = "10.0.0.129"
  key_name               = "${aws_key_pair.k8s_auth.id}"
  vpc_security_group_ids = ["${aws_security_group.k8s_lb_sg.id}"]
  subnet_id              = "${aws_subnet.k8s_subnet.id}"
  user_data              = "${file("/Users/andeladeveloper/Documents/kthw/modules/v1/userdata")}"

  #   provisioner "local-exec" {
  #     command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.wp_dev.id} --profile chuka && ansible-playbook -i /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/aws_hosts /Users/andeladeveloper/Documents/AWS-files/wordpress/modules/v1/files/wordpress.yml"
  #   }
}
