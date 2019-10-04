#----subnet/main.tf----

data "aws_availability_zones" "available" {
}

resource "aws_subnet" "tf_public_subnet" {
  count                   = 2
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = var.subnet_name[count.index]
    Description = var.subnet_desc[count.index]
  }
}
