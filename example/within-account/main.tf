# VPC Peering within AWS account
provider "aws" {
  region  = "ap-south-1"
  profile = "current-profile-name"
  # Requester's credentials.
}

module "peering_within_account" {
  source           = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_vpc_id  = "vpc-111111111111"
  requester_vpc_id = "vpc-999999999999"
  providers = {
    aws.this = aws
    aws.peer = aws
  }
}
