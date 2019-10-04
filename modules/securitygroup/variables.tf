#----SecurityGroup/variables.tf----
variable "vpc_id" {
}

variable "sg_desc" {
}

variable "ingress_ip1" {
}

variable "ingress_ip2" {
}

variable "egress_ip1" {
}

variable "ingress_protocol1" {
}

variable "ingress_protocol2" {
}

variable "ingress_port1" {
}

variable "ingress_port2" {
}

variable "egress_port1" {
}

variable "egress_protocol1" {
}

variable "instance_security_group_name" {
  description = "The name of the security group for the EC2 Instances"
  type        = string
  default     = "Farmers_EC2_SG"
}

