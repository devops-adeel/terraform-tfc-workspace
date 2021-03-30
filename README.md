![inspec-test](https://github.com/devops-adeel/terraform-tfc-workspace/actions/workflows/terraform-apply.yml/badge.svg)

## Terraform TFC Workspace Module

This terraform module creates TFC/E workspaces with Vault integration. Vault
shall manage the team token dedicated for running this workspace.

It is intended to be used by a CICD pipeline outside of VCS Integration.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```hcl

module "terraform_workspace" {
  source               = "git::https://github.com/devops-adeel/terraform-tfc-workspace.git?ref=v0.1.0"
  application_name     = local.application_name
  vault_namespace      = local.namespace
  username             = var.username
  vault_address        = var.vault_address
  organization         = var.organization
  vault_approle_id     = module.vault_approle.approle_id
  vault_approle_secret = module.vault_approle.approle_secret
  backend_path         = module.tfc_secrets.backend_path
}
```

## Requirements

Vault is required as well as having setup Vault TFC Secrets Engine, see
[here](https://github.com/devops-adeel/terraform-vault-secrets-tfc.git)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_team.default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) | resource |
| [tfe_team_access.default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_access) | resource |
| [tfe_team_member.default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_member) | resource |
| [tfe_variable.approle_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.approle_secret](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.vault_addr](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.vault_address](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.vault_namespace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.vault_token_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [vault_terraform_cloud_secret_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/terraform_cloud_secret_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the application/customer | `string` | n/a | yes |
| <a name="input_backend_path"></a> [backend\_path](#input\_backend\_path) | The secret backend mount Vault TFC secrets engine. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | TFC Organisation. | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | TFC username | `string` | n/a | yes |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault Address URL | `string` | n/a | yes |
| <a name="input_vault_approle_id"></a> [vault\_approle\_id](#input\_vault\_approle\_id) | Vault Approle ID | `string` | n/a | yes |
| <a name="input_vault_approle_secret"></a> [vault\_approle\_secret](#input\_vault\_approle\_secret) | Vault Approle Secret ID | `string` | n/a | yes |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | Vault namespace to add as TFC variable | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_secret_role"></a> [tfc\_secret\_role](#output\_tfc\_secret\_role) | Vault Secret role name |
| <a name="output_tfc_team_id"></a> [tfc\_team\_id](#output\_tfc\_team\_id) | Terraform Cloud Team ID |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | TFC workspace ID |
| <a name="output_workspace_name"></a> [workspace\_name](#output\_workspace\_name) | TFC workspace name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
