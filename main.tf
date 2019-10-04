#----root/main.tf-----
provider "aws" {
  region = "us-east-2"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

# Deploy vpc Resources
module "vpc" {
  source = "./modules/vpc"
  #Number of VPCs to be provisioned
  vpc_count = 3

  #VPC Names
  vpc_name = [
    "Farmers_VPC_1",
    "Farmers_VPC_2",
    "Farmers_VPC_3"
  ]

  #VPC CIDR Ranges
  vpc_cidr = [
    "10.123.0.0/16",
    "10.124.0.0/16",
    "10.125.0.0/16"
  ]
}


# Deploy Internet Gateway
module "internetgateway" {
  source    = "./modules/internetgateway"
  tf_vpc_id = "vpc-0895b015806097e6b"
  igw_name  = "Farmers_VPC_IGW"
}

# Deploy Security Group Resources
module "securitygroup" {
  source = "./modules/securitygroup"

  #VPC ID where SG needs to be provisioned
  vpc_id = "vpc-0895b015806097e6b"

  ##Details of security group settings

  #Ingress IP 1 & 2
  ingress_ip1 = "0.0.0.0/0"
  ingress_ip2 = "0.0.0.0/0"

  #Egress IP1
  egress_ip1 = "0.0.0.0/0"

  #Name of security group
  instance_security_group_name = "Farmers_EC2_SG"

  #Description of security group
  sg_desc = "This is a security group for EC2 intance"

  #Ingress 1 & 2 protocols
  ingress_protocol1 = "tcp"
  ingress_protocol2 = "tcp"

  #Ingress 1 & 2 ports
  ingress_port1 = "22"
  ingress_port2 = "80"

  #Egress 1 port
  egress_port1 = "0"

  #Egress 1 protocol
  egress_protocol1 = "-1"
}

# Deploy Subnet Resources
module "subnets" {
  source = "./modules/subnets"
  #VPC ID Where subnets need to be provisioned
  vpc_id = "vpc-0895b015806097e6b"

  #Name of subnets
  subnet_name = [
    "aws-use2-core-shsv-trs-az1",
    "aws-use2-core-shsv-trs-az2"
  ]

  #Description of subnets
  subnet_desc = [
    "Core Shared Services Trusted AZ1",
    "Core Shared Services Trusted AZ2"
  ]

  #CIDR range of subnets
  public_cidrs = [
    "10.123.1.0/24",
    "10.123.2.0/24"
  ]

}



