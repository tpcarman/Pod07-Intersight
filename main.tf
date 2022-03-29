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