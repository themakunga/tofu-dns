terraform {
  required_version = ">= 1.10.0"

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "~> 0.29.0"
    }
  }
}

provider "tailscale" {
  tailnet = var.tailscale_name
  api_key = var.tailscale_api_key
}
