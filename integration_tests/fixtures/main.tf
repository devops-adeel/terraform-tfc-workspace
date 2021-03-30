module "default" {
  source               = "./module"
  application_name     = local.application_name
  vault_namespace      = local.namespace
  email                = var.email
  username             = var.username
  vault_address        = var.vault_address
  organization         = var.organization
  vault_approle_id     = module.vault_approle.approle_id
  vault_approle_secret = module.vault_approle.approle_secret
  backend_path         = module.tfc_secrets.backend_path
}

data "vault_auth_backend" "default" {
  path = "approle"
}

module "tfc_secrets" {
  source     = "git::https://github.com/devops-adeel/terraform-vault-secrets-tfc.git?ref=v0.2.0"
  entity_ids = [module.vault_approle.entity_id]
  token      = var.token
}

module "vault_approle" {
  source           = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.6.1"
  application_name = local.application_name
  env              = local.env
  service          = local.service
  mount_accessor   = data.vault_auth_backend.default.accessor
}
