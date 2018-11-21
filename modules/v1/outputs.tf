output "AZLength" {
  value = "${length(data.aws_availability_zones.available.names)}"
}

output "AZs" {
  value = "${data.aws_availability_zones.available.names}"
}
