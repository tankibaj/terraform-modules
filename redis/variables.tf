variable "name" {
  description = "Name of redis cluster"
  type = string
}

variable "vpc_environment" {
  description = "Name of the VPC environment"
  type = string
}

variable "node_type" {
  description = "Type of redis cluster node"
  type = string
  default = "cache.m4.large"
}

variable "num_cache_clusters" {
  description = "Number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2."
  type = number
  default = 2
}

variable "multi_az_enabled" {
  description = "Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic_failover_enabled must also be enabled"
  type = bool
  default = true
}

variable "automatic_failover_enabled" {
  description = " Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups."
  type = bool
  default = true
}

variable "parameter_group_name" {
  description = "Name of the parameter group to associate with this replication group"
  type = string
  default = "default.redis6.x.cluster.on"
}