data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

##########################
# VPC peering connection #
##########################
resource "aws_vpc_peering_connection" "vpc_peering_connection" {
  provider      = aws.this
  peer_owner_id = var.accepter_owner_id != 0 ? var.accepter_owner_id : data.aws_caller_identity.current.account_id
  peer_vpc_id   = var.accepter_vpc_id
  vpc_id        = var.requester_vpc_id
  peer_region   = var.accepter_region != "" ? var.accepter_region : data.aws_region.current.name
  auto_accept   = false
  tags          = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-${var.app_name}" }))
}

######################################
# VPC peering accepter configuration #
######################################
resource "aws_vpc_peering_connection_accepter" "peer_accepter" {
  count                     = var.auto_accept_peering ? 1 : 0
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
  auto_accept               = var.auto_accept_peering ? var.auto_accept_peering : (var.accepter_region == "" ? true : var.auto_accept_peering)
  tags                      = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-${var.app_name}" }))
}

#######################
# VPC peering options #
#######################
resource "aws_vpc_peering_connection_options" "requester_dns_resolution" {
  count                     = var.auto_accept_peering ? 1 : 0
  provider                  = aws.this
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer_accepter[0].id

  requester {
    allow_remote_vpc_dns_resolution = var.requester_dns_resolution
  }
}

resource "aws_vpc_peering_connection_options" "accepter_dns_resolution" {
  count                     = var.auto_accept_peering ? 1 : 0
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer_accepter[0].id

  accepter {
    allow_remote_vpc_dns_resolution = var.accepter_dns_resolution
  }
}

resource "aws_route" "aws_route_peering" {
  count                     = var.create_peering_routes ? length(var.destination_cidr_blocks) : 0
  provider                  = aws.this
  route_table_id            = var.route_table_id
  destination_cidr_block    = element(var.destination_cidr_blocks, count.index)
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
}
