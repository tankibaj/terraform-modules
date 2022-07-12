################################################################################
# Requester
################################################################################
resource "aws_vpc_peering_connection" "this" {
  peer_owner_id = element(split(":", var.accepter_assume_role_arn), 4)
  peer_vpc_id   = var.accepter_vpc_id
  vpc_id        = var.requester_vpc_id

  tags = local.tags
}

resource "aws_vpc_peering_connection_options" "requester" {
  provider                  = aws.requester
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

  requester {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }
}

# Route from requester to accepter cidr
resource "aws_route" "requester" {
  count = var.enable_requester_route ? local.requester_route_table_ids_count : 0

  provider                  = aws.requester
  route_table_id            = local.requester_route_table_ids[count.index]
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

  depends_on = [aws_vpc_peering_connection.this]
}


################################################################################
# Accepter
################################################################################
resource "aws_vpc_peering_connection_accepter" "this" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  auto_accept               = var.auto_accept

  tags = local.tags

  depends_on = [aws_vpc_peering_connection.this]
}

resource "aws_vpc_peering_connection_options" "accepter" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

  accepter {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }
}

# Route from accepter to requester cidr
resource "aws_route" "accepter" {
  count = var.enable_accepter_route ? local.accepter_route_table_ids_count : 0

  provider                  = aws.accepter
  route_table_id            = local.accepter_route_table_ids[count.index]
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

  depends_on = [aws_vpc_peering_connection_accepter.this]
}