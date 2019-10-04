#----subnet/variables.tf----
variable "vpc_id" {
}

variable "subnet_name" {
  type = list(string)
}

variable "subnet_desc" {
  type = list(string)
}

variable "public_cidrs" {
  type = list(string)
}

