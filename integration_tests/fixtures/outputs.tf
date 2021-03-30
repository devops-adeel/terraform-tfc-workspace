output "token" {
  description = "Terraform workspace token"
  value       = vault_terraform_cloud_secret_creds.default.token
}

output "url" {
  description = "Terraform Cloud URL"
  value       = "https://app.terraform.io"
}

output "workspace" {
  description = "TFC Workspace ID"
  value       = module.default.workspace_id
}

output "team_id" {
  description = "Terraform Cloud Team ID"
  value       = module.default.tfc_team_id
}
