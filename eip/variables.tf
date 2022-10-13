variable "name" {
  description = "Name of Elastic IP address"
  type        = string
}

variable "network_border_group" {
  description = "Location from which the IP address is advertised. Use this parameter to limit the address to this location"
  type        = string
  default     = "eu-central-1"
}

variable "vpc" {
  description = "Boolean if the EIP is in a VPC or not. Defaults to true unless the region supports EC2-Classic"
  type        = string
  default     = true
}