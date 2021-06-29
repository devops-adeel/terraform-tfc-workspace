terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
    tfe = {
      version = "~> 0.25.0"
    }
  }
  backend "remote" {
    organization = "hc-implementation-services"

    workspaces {
      name = "terraform-tfc-workspace"
    }
  }
}

data "terraform_remote_state" "default" {
  backend = "remote"

  config = {
    organization = "hc-implementation-services"

    workspaces = {
      name = "terraform-hcp-vault"
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

