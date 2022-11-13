output "arn" {
  description = "ARN of the created ElastiCache Replication Group"
  value       = aws_elasticache_replication_group.this.arn
}

output "configuration_endpoint_address" {
  description = "Address of the replication group configuration endpoint when cluster mode is enabled"
  value       = aws_elasticache_replication_group.this.configuration_endpoint_address
}

output "primary_endpoint_address" {
  description = "Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled"
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "Address of the endpoint for the reader node in the replication group, if the cluster mode is disabled"
  value       = aws_elasticache_replication_group.this.reader_endpoint_address
}
