module "peering_within_account" {
  source           = "./terraform-aws-vpc-peering-0.0.1"
  accepter_vpc_id  = local.workspace["peering_within_account"].accepter_vpc_id
  requester_vpc_id = local.workspace["peering_within_account"].requester_vpc_id
  project_name_prefix = local.workspace["peering_within_account"].project_name_prefix
  providers = {
    aws.this = aws
    aws.peer = aws
  }
}

module "peering_different_account" {
  source              = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_region     = local.workspace["peering_different_account"].accepter_region
  accepter_owner_id   = local.workspace["peering_different_account"].accepter_owner_id
  accepter_vpc_id     = local.workspace["peering_different_account"].accepter_vpc_id
  requester_vpc_id    = local.workspace["peering_different_account"].requester_vpc_id
  auto_accept_peering = local.workspace["peering_different_account"].auto_accept_peering
  project_name_prefix = local.workspace["peering_different_account"].project_name_prefix
  providers = {
    aws.this = aws
    aws.peer = aws
  }
}