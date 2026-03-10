variable "federated_oidc_providers" {
  type = list(object({
    name   = string
    issuer = string
  }))
  default = []
}

output "providers" {
  value       = var.federated_oidc_providers
  description = "List of OIDC providers wired into the platform"
}
