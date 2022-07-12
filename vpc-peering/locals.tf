locals {
  requester_route_table_ids       = try(distinct(sort(data.aws_route_table.requester.*.route_table_id)), [])
  requester_route_table_ids_count = length(local.requester_route_table_ids)

  accepter_route_table_ids       = try(distinct(sort(data.aws_route_table.accepter.*.route_table_id)), [])
  accepter_route_table_ids_count = length(local.accepter_route_table_ids)

  tags = {
    Name      = var.name
    Terraform = true
  }
}