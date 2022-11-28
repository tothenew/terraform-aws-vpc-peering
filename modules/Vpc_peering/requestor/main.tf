resource "aws_vpc_peering_connection" "requestor" {
    provider = aws.default

    peer_owner_id   = var.peer_owner_id
    peer_vpc_id     = var.vpc2_id
    peer_region     = "us-east-2"
    vpc_id          = var.vpc1_id
    auto_accept     = false

    tags = {
        Name = "peer-vpc1-to-vpc2"
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
provider "aws" {
    alias   = "default"
    region = "ap-south-1"
    profile = "ankit"
}


