# VPC Peering within AWS account
provider "aws" {
  region  = "ap-east-2"
  profile = "ABC"
  # Requester's credentials.
}

module "peering_within_account" {
  source           = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_vpc_id  = "vpc-009988776544"
  requester_vpc_id = "vpc-009988776655"
  providers = {
    aws.this = aws
    aws.peer = aws
  }
}
