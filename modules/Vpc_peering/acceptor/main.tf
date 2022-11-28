resource "aws_vpc_peering_connection_accepter" "peer" {
    vpc_peering_connection_id = var.pcx_id
    auto_accept               = true

    tags = {
        Side = "Accepter"
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