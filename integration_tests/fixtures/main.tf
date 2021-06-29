locals {
  vault_address = data.terraform_remote_state.default.outputs.vault_public_endpoint_url
  application   = format("%s-%s", local.env, local.service)
  env           = "terraform-tfc"
  service       = "workspace"
  token         = var.token
  organization  = var.organization
}

module "default" {
  source               = "./module"
  vault_namespace      = format("admin/%s", local.application)
  organization         = local.organization
  usernames            = ["devops-adeel"]
  application_name     = format("%s-module", local.application)
  vault_address        = local.vault_address
  vault_approle_id     = module.vault_approle.approle_id
  vault_approle_secret = module.vault_approle.approle_secret
  backend_path         = module.tfc_secrets.backend_path
}

data "vault_auth_backend" "default" {
  path = "approle"
}

module "tfc_secrets" {
  source = "git::https://github.com/devops-adeel/terraform-vault-secrets-tfc.git?ref=v0.4.0"
  token  = local.token
}

module "vault_static_secrets" {
  source = "git::https://github.com/devops-adeel/terraform-vault-secrets-kv.git?ref=v0.3.0"
}

module "vault_approle" {
  source            = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.7.0"
  application_name  = local.application
  env               = local.env
  service           = format("%s-module", local.service)
  mount_accessor    = data.vault_auth_backend.default.accessor
  identity_group_id = module.vault_static_secrets.identity_group_id
}

# resource "vault_terraform_cloud_secret_creds" "default" {
#   backend = module.tfc_secrets.backend_path
#   role    = module.default.tfc_secret_role
# }
