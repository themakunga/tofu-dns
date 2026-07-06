data "tailscale_device" "local_pihole" {
  hostname = var.host_name
  wait_for = "60s"
}

resource "tailscale_dns_nameservers" "pihole_nameserver" {
  nameservers = [
    data.tailscale_device.local_pihole.addresses[0]
  ]
}

resource "tailscale_dns_preferences" "dns_prefs" {
  magic_dns = true
}
