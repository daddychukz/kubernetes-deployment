variable "aws_region" {}
variable "aws_profile" {}
data "aws_availability_zones" "available" {}
variable "vpc_cidr" {}

variable "cidrs" {
  type = "map"
}

variable "k8s_instance_type" {}
variable "k8s_ami" {}
variable "key_name" {}
variable "lc_instance_type" {}
variable "public_key_path" {}
