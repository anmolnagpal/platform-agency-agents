variable "aws_region" {
  type        = string
  description = "Primary AWS region"
}

variable "gcp_region" {
  type        = string
  description = "Primary GCP region"
}

variable "aws_cidr" {
  type        = string
  description = "AWS VPC CIDR"
}

variable "azure_cidr" {
  type = string
}

variable "gcp_cidr" {
  type = string
}

variable "federated_oidc_providers" {
  type        = list(object({ name = string, issuer = string }))
  description = "OIDC providers for workload identity"
}

variable "opa_bundle_url" {
  type        = string
  description = "Location of the policy bundle"
}
