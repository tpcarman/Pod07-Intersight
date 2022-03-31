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

resource "Pod07_ntp "ntp1" {
  name        = "ntp1"
  description = "test policy"
  enabled     = true
  ntp_servers = [
    "ntp.esl.cisco.com",
    "time-a-g.nist.gov",
    "time-b-g.nist.gov"
  ]
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization_moid.id
  }
}
variable "organization" {
   type = string
   description = "value for organization"
 }
}
