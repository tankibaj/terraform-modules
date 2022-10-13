variable "domain" {
  description = "The domain to create the SES identity"
  type        = string
}

variable "emails" {
  description = "List of email addresses to assign to SES"
  type        = list(string)
  default     = []
}