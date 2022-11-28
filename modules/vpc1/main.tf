resource "aws_vpc" "vpc1" {
    cidr_block       = var.cidr_block
    instance_tenancy = "default"
    tags = {
        Name = var.vpcname
    }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}