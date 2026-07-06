variable "tailscale_name" {
  type        = string
  description = "Tauscale name"
}

variable "tailscale_api_key" {
  type      = string
  sensitive = true
  default   = null
}

variable "host_name" {
  type        = string
  description = "machine hostname"
}
