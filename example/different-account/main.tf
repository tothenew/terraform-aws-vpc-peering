# VPC Peering within different AWS account
provider "aws" {
  region = "ap-south-1"
  profile = "current-profile-name"
  # Requester's credentials.
}

provider "aws" {
  alias  = "peer"
  region = "us-east-1"
  profile = "peer-profile-name"
  # Accepter's credentials.
}

module "peering_different_account" {
  source              = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_region     = "us-east-1"
  accepter_owner_id   = "111111111111"
  accepter_vpc_id     = "vpc-111111111111"
  requester_vpc_id    = "vpc-999999999999"
  auto_accept_peering = true
}
