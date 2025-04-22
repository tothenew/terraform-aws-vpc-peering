# VPC Peering within AWS account
provider "aws" {
  region  = "ap-east-2"
  profile = "Dhruv Gupta"
  # Requester's credentials.
}

module "peering_within_account" {
  source           = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_vpc_id  = "vpc-09aceeb53e4bd8994"
  requester_vpc_id = "vpc-00da5792f9cb19678"
  providers = {
    aws.this = aws
    aws.peer = aws
  }
}
