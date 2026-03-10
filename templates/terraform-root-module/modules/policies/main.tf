variable "opa_bundle_url" {
  type        = string
  description = "URL for retrieving OPA policy bundles"
}

output "bundle_url" {
  value       = var.opa_bundle_url
  description = "Surface the OPA bundle so downstream modules can reference it"
}
