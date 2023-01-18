# VPC Peering within AWS account
module "peering_within_account" {
  source           = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_vpc_id  = "vpc-111111111111"
  requester_vpc_id = "vpc-999999999999"
}
