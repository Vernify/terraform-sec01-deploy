output "sec01_vm_id" {
  description = "Proxmox VM ID for sec01."
  value       = module.sec01.vm_id
}

output "sec01_ipv4_address" {
  description = "IPv4 address assigned to sec01."
  value       = module.sec01.ipv4_address
}
