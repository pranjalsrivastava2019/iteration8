#----vpc/main.tf----

resource "aws_vpc" "tf_vpc" {
  count = var.vpc_count
  cidr_block           = var.vpc_cidr[count.index]
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name[count.index]
  }
}
