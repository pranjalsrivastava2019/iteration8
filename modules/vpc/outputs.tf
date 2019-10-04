#-----vpc/outputs.tf----

output "tf_vpc_id" {
  value = aws_vpc.tf_vpc.*.id
}

