#----SecurityGroup/main.tf----

resource "aws_security_group" "instance_sg" {
  name        = var.instance_security_group_name
  description = var.sg_desc
  vpc_id      = var.vpc_id

  #SSH

  ingress {
    from_port   = var.ingress_port1
    to_port     = var.ingress_port1
    protocol    = var.ingress_protocol1
    cidr_blocks = [var.ingress_ip1]
  }

  #HTTP
  ingress {
    from_port   = var.ingress_port2
    to_port     = var.ingress_port2
    protocol    = var.ingress_protocol2
    cidr_blocks = [var.ingress_ip2]
  }

  egress {
    from_port   = var.egress_port1
    to_port     = var.egress_port1
    protocol    = var.egress_protocol1
    cidr_blocks = [var.egress_ip1]
  }
}
