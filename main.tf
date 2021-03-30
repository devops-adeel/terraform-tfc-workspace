/**
 * Usage:
 *
 * ```hcl
 *
 * module "terraform_workspace" {
 *   source               = "git::https://github.com/devops-adeel/terraform-tfc-module.git?ref=v0.1.0"
 *   application_name     = local.application_name
 *   vault_namespace      = local.namespace
 *   username             = var.username
 *   vault_address        = var.vault_address
 *   organization         = var.organization
 *   vault_approle_id     = module.vault_approle.approle_id
 *   vault_approle_secret = module.vault_approle.approle_secret
 *   backend_path         = module.tfc_secrets.backend_path
 * }
 * ```
 */


resource "tfe_team" "default" {
  name         = var.application_name
  organization = var.organization
}

resource "tfe_team_member" "default" {
  team_id  = tfe_team.default.id
  username = var.username
}

resource "tfe_workspace" "default" {
  name                  = var.application_name
  organization          = var.organization
  allow_destroy_plan    = true
  execution_mode        = "remote"
  file_triggers_enabled = false
}

resource "tfe_team_access" "default" {
  access       = "write"
  team_id      = tfe_team.default.id
  workspace_id = tfe_workspace.default.id
}

resource "tfe_variable" "vault_addr" {
  key          = "VAULT_ADDR"
  value        = var.vault_address
  category     = "env"
  workspace_id = tfe_workspace.default.id
  description  = "Vault Address URL"
}

resource "tfe_variable" "vault_token_name" {
  key          = "VAULT_TOKEN_NAME"
  value        = var.application_name
  category     = "env"
  workspace_id = tfe_workspace.default.id
  description  = "Vault Token Name"
}

resource "tfe_variable" "vault_namespace" {
  key          = "VAULT_NAMESPACE"
  value        = var.vault_namespace
  category     = "env"
  workspace_id = tfe_workspace.default.id
  description  = "Vault Namespace"
}

resource "tfe_variable" "approle_id" {
  key          = "approle_id"
  value        = var.vault_approle_id
  category     = "terraform"
  workspace_id = tfe_workspace.default.id
  description  = "Vault Approle ID"
  sensitive    = true
}

resource "tfe_variable" "approle_secret" {
  key          = "approle_secret"
  value        = var.vault_approle_secret
  category     = "terraform"
  workspace_id = tfe_workspace.default.id
  description  = "Vault Approle ID"
  sensitive    = true
}

resource "tfe_variable" "vault_address" {
  key          = "vault_address"
  value        = var.vault_address
  category     = "terraform"
  workspace_id = tfe_workspace.default.id
  description  = "Vault Address URL"
}

resource "vault_terraform_cloud_secret_role" "default" {
  backend      = var.backend_path
  name         = var.application_name
  organization = var.organization
  team_id      = tfe_team.default.id
}
