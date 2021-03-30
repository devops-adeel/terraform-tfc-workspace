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
