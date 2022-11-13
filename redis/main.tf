locals {
  name = "cache-${var.name}"
  tags = {
    Terraform = true
  }
}

module "vpc" {
  source      = "../vpc-remote-state"
  environment = var.vpc_environment
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${local.name}-subnet"
  subnet_ids = module.vpc.database_subnets
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group
resource "aws_elasticache_replication_group" "this" {
  replication_group_id       = local.name
  description                = "Terraform managed ElastiCache for ${local.name}"
  node_type                  = var.node_type
  num_cache_clusters         = var.num_cache_clusters
  multi_az_enabled           = var.multi_az_enabled
  automatic_failover_enabled = var.automatic_failover_enabled
  parameter_group_name       = var.parameter_group_name
  port                       = 6379
  security_group_ids         = [module.redis_sg.security_group_id]
  subnet_group_name          = aws_elasticache_subnet_group.this.name
  snapshot_retention_limit   = 7

  tags = local.tags

  lifecycle {
    ignore_changes = [num_cache_clusters]
  }
}

module "redis_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = local.name
  description = "Allow redis within vpc"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["redis-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    Name      = "sg-${local.name}"
    Terraform = true
  }
}
