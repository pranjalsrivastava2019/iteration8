#-----internetgateway/outputs.tf----

output "tf_igw_id" {
  value = aws_internet_gateway.tf_internet_gateway.id
}