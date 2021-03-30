variable "vault_address" {
  description = "Vault Address"
  type        = string
}

variable "token" {
  description = "TFC Token"
  type        = string
  sensitive   = true
  default = "***REMOVED***"
}

variable "organization" {
  description = "TFC Org"
  type        = string
}

variable "email" {
  description = "TFC User Email Address"
  type        = string
}

variable "username" {
  description = "TFC Username"
  type        = string
}
