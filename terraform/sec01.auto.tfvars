# Vernify sec01 configuration (security core: step-ca PKI + Vault)

vm_name           = "sec01"
proxmox_node      = "pve08"
vm_cores          = 8
vm_memory         = 16384
disk_size         = 60
proxmox_datastore = "pve-08-zfs"
network_bridge    = "vmbr0"
template_name     = "ubuntu-24.04-template"
ci_user           = "werner"

# SSH access
ssh_public_keys = [
  "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHBONYUsAucJJGHF+ZCX/ikkvdxdm6beeqKGK/ctw1+1JqApjaAcYspGWehW7vmqkyeM+GuUm5qgi7+hHqDKAjE= wernervandermerwe@Werners-Laptop.local"
]

# Static IP for sec01 (same subnet as dev01, but .51 instead of .50)
ipv4_address  = "192.168.22.51/24"
ipv4_gateway  = "192.168.22.1"
search_domain = "vernify.com"

# VM tags for Proxmox organization
tags = ["vernify", "security", "pki"]
