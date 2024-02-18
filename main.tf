provider "aws" {
  profile = "mohsinvpc"
  region = "us-west-2"
}

terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "Mohsin-VPC" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"

  tags = {
    Name = "Mohsin-VPC"
  }
}

output "vpc_id" {
  value = resource.aws_vpc.Mohsin-VPC.id
}
