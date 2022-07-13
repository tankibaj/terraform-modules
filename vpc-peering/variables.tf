variable "name" {
  description = "The name of vpc peer"
  type        = string
}

variable "allow_remote_vpc_dns_resolution" {
  description = "Allow accepter vpc to resolve public dns hostnames to private ip addresses when queried from instances in the requester vpc"
  type        = bool
  default     = true
}

################################################################################
# Requester
################################################################################
variable "requester_region" {
  description = "Requester aws region"
  type        = string
  default     = "eu-central-1"
}

variable "requester_assume_role_arn" {
  description = "Requester assume role arn"
  type        = string
}

variable "requester_vpc_id" {
  description = "The id of the requester vpc"
  type        = string
}

variable "enable_requester_route" {
  description = "Enable requester routes to accepter vpc"
  type        = bool
  default     = true
}

################################################################################
# Accepter
################################################################################
variable "accepter_region" {
  description = "Accepter aws region"
  type        = string
  default     = "eu-central-1"
}

variable "accepter_assume_role_arn" {
  description = "Accepter assume role arn"
  type        = string
}

variable "accepter_vpc_id" {
  description = "The id of the accepter vpc"
  type        = string
}

variable "auto_accept" {
  description = "Whether or not to accept the peering request"
  type        = bool
  default     = true
}

variable "enable_accepter_route" {
  description = "Enable accepter routes to requester vpc"
  type        = bool
  default     = true
}