variable "proxmox_api_url" {
  description = "Proxmox API URL (e.g., https://pve08.vernify.com:8006/api2/json)."
  type        = string
  default     = "https://pve08.vernify.com:8006/api2/json"
}

variable "proxmox_user" {
  description = "Proxmox user (username@realm)."
  type        = string
  default     = "root@pam"
}

variable "proxmox_password" {
  description = "Proxmox password."
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "Name of the VM."
  type        = string
  default     = "sec01"
}

variable "proxmox_node" {
  description = "Proxmox node to create the VM on."
  type        = string
  default     = "pve"
}

variable "proxmox_datastore" {
  description = "Datastore for the VM disk, EFI disk, and cloud-init drive."
  type        = string
  default     = "Proxmox_LVM"
}

variable "network_bridge" {
  description = "Bridge for the VM's primary NIC."
  type        = string
  default     = "vmbr0"
}

variable "template_name" {
  description = "Packer template to clone."
  type        = string
  default     = "ubuntu-24.04-template"
}

variable "vm_cores" {
  description = "vCPU cores for sec01 (higher than dev01 for PKI/Vault workload)."
  type        = number
  default     = 8
}

variable "vm_memory" {
  description = "Memory (MiB) for sec01 (higher than dev01 for PKI/Vault workload)."
  type        = number
  default     = 16384
}

variable "disk_size" {
  description = "Disk size (GiB) for sec01."
  type        = number
  default     = 60
}

variable "ci_user" {
  description = "cloud-init login user."
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_keys" {
  description = "SSH public keys authorised for the cloud-init user. REQUIRED for Ansible access (e.g. the bootstrap key's .pub). Public keys are not secret."
  type        = list(string)
  default     = []
}

variable "ipv4_address" {
  description = "cloud-init IPv4 address: 'dhcp' or a CIDR like '192.0.2.10/24'."
  type        = string
  default     = "dhcp"
}

variable "ipv4_gateway" {
  description = "Gateway when ipv4_address is a static CIDR; null for DHCP."
  type        = string
  default     = null
}

variable "search_domain" {
  description = "DNS search domain applied to the VM via cloud-init."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the VM."
  type        = list(string)
  default     = []
}

