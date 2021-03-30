terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
    tfe = {
      version = "~> 0.24.0"
    }
  }
  backend "remote" {
    organization = "hc-implementation-services"

    workspaces {
      name = "terraform-tfc-workspace"
    }
  }
}

variable "approle_id" {}
variable "approle_secret" {}

provider "vault" {
  auth_login {
    namespace = "admin/terraform-tfc-workspace"
    path      = "auth/approle/login"

    parameters = {
      role_id   = var.approle_id
      secret_id = var.approle_secret
    }
  }
}

locals {
  application_name = "terraform-modules-development-tfc"
  namespace        = "admin/terraform-tfc-workspace"
  env              = "dev"
  service          = "web"
}
