variable "username" {
  description = "TFC username"
  type        = string
}

variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "vault_address" {
  description = "Vault Address URL"
  type        = string
}

variable "vault_approle_id" {
  description = "Vault Approle ID"
  type        = string
  sensitive   = true
}

variable "vault_approle_secret" {
  description = "Vault Approle Secret ID"
  type        = string
  sensitive   = true
}

variable "vault_namespace" {
  description = "Vault namespace to add as TFC variable"
  type        = string
}

variable "backend_path" {
  description = "The secret backend mount Vault TFC secrets engine."
  type        = string
}

variable "organization" {
  description = "TFC Organisation."
  type        = string
}
