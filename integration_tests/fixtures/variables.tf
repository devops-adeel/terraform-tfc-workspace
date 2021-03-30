variable "vault_address" {
  description = "Vault Address"
  type        = string
}

variable "token" {
  description = "TFC Token"
  type        = string
  sensitive   = true
  default = "JmelfnesiN4yaw.atlasv1.caBIH7m1F8j1xkTTAf7xI6BlTVYGvOOlwBKjjcAeOnemzT1UYl95tIyxnfXF0dhIaaI"
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
