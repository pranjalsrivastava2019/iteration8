#----internetgateway/main.tf----

resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = var.tf_vpc_id

  tags = {
    Name = var.igw_name
  }
}
