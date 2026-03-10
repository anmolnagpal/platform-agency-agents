terraform {
  required_version = ">= 1.5.0"
  backend "remote" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.20"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}

provider "google" {
  region = var.gcp_region
}

module "network" {
  source = "./modules/network"

  aws_cidr = var.aws_cidr
  azure_cidr = var.azure_cidr
  gcp_cidr = var.gcp_cidr
}

module "identity" {
  source = "./modules/identity"

  federated_oidc_providers = var.federated_oidc_providers
}

module "policies" {
  source = "./modules/policies"

  opa_bundle_url = var.opa_bundle_url
}
