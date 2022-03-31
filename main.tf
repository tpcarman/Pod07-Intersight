terraform {
  required_providers {
    intersight = {
      source = "ciscodevnet/intersight"
      version = "1.0.11"
    }
  }
}

provider "intersight" {
  apikey    = var.api_key_id
  secretkey = var.api_private_key
  endpoint  = var.api_endpoint
}

data "intersight_organization_organization" "organization_moid" {
  name = "default"
}

output "Pod07_organization_moid" {
  description = "organization id"
  value       = data.intersight_organization_organization.organization_moid.id
}
