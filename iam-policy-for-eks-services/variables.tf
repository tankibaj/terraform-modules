variable "policy_name_prefix" {
  description = "IAM policy name prefix"
  type        = string
  default     = "AmazonEKS_"
}

variable "attach_role_name" {
  description = "The name of the IAM roles to which the policy should be applied"
  type        = string
}

# --- Velero
variable "attach_velero_policy" {
  description = "Determines whether to attach the Velero IAM policy to the role"
  type        = bool
  default     = false
}

variable "velero_s3_bucket_arns" {
  description = "List of S3 Bucket ARNs that Velero needs"
  type        = list(string)
  default     = ["*"]
}

# --- Harbor
variable "attach_harbor_policy" {
  description = "Determines whether to attach the Harbor IAM policy to the role"
  type        = bool
  default     = false
}

variable "harbor_s3_bucket_arns" {
  description = "List of S3 Bucket ARNs that Harbor needs"
  type        = list(string)
  default     = ["*"]
}

# --- Loki
variable "attach_loki_policy" {
  description = "Determines whether to attach the Loki IAM policy to the role"
  type        = bool
  default     = false
}

variable "loki_s3_bucket_arns" {
  description = "List of S3 Bucket ARNs that Loki needs"
  type        = list(string)
  default     = ["*"]
}

# --- Cortex
variable "attach_cortex_policy" {
  description = "Determines whether to attach the Cortex IAM policy to the role"
  type        = bool
  default     = false
}

variable "cortex_s3_bucket_arns" {
  description = "List of S3 Bucket ARNs that Cortex needs"
  type        = list(string)
  default     = ["*"]
}

# --- KMS
variable "attach_kms_policy" {
  description = "Determines whether to attach the KMS IAM policy to the role"
  type        = bool
  default     = false
}
variable "kms_arns" {
  description = "List of KMS ARNs that EKS cluster needs"
  type        = list(string)
  default     = ["*"] # -- Don't use kms alias arn
}
