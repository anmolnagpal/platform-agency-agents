variable "aws_cidr" {
  type = string
}

variable "azure_cidr" {
  type = string
}

variable "gcp_cidr" {
  type = string
}

locals {
  cidr_map = {
    aws   = var.aws_cidr
    azure = var.azure_cidr
    gcp   = var.gcp_cidr
  }
}

output "cidr_map" {
  description = "Exposes CIDR assignments per cloud for higher-level modules"
  value       = local.cidr_map
}
