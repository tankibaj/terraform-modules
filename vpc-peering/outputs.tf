output "vpc_peering_id" {
  description = "The id of the vpc peering connection"
  value       = aws_vpc_peering_connection.this.id
}

output "vpc_peering_accept_status" {
  description = "The status of the vpc peering connection request"
  value       = aws_vpc_peering_connection_accepter.this.accept_status
}