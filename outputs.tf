output "workspace_id" {
  description = "TFC workspace ID"
  value       = tfe_workspace.default.id
}

output "workspace_name" {
  description = "TFC workspace name"
  value       = tfe_workspace.default.name
}

output "tfc_team_id" {
  description = "Terraform Cloud Team ID"
  value       = tfe_team.default.id
}

output "tfc_secret_role" {
  description = "Vault Secret role name"
  value       = vault_terraform_cloud_secret_role.default.name
}
