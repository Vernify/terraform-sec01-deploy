# terraform-sec01-deploy

Provisioning for `sec01` (Vernify security core: step-ca PKI + HashiCorp Vault).

## Quick Start

```bash
docker-compose run --rm terraform init
docker-compose run --rm terraform plan
docker-compose run --rm terraform apply
```

## What This Does

Provisions the `sec01` Ubuntu 24.04 VM on Proxmox via `terraform-proxmox-vm` module:
- 8 vCPU, 16GB RAM (sized for PKI/Vault workload)
- Static IP: 192.168.22.51/24 (same subnet as dev01)
- Cloud-init with SSH key access
- Tags: `vernify`, `security`, `pki`

**Note:** This repo only provisions the VM. Configuration (step-ca + Vault installation) is handled by Ansible playbooks in a separate workflow.

## Credentials

Set `TF_VAR_proxmox_password` environment variable before running:

```bash
export TF_VAR_proxmox_password="<proxmox-password>"
docker-compose run --rm terraform plan
```

## Outputs

- `sec01_vm_id` — Proxmox VM ID
- `sec01_ipv4_address` — The assigned IPv4 address (feed this into Ansible inventory)

## State

State is stored locally in `terraform.tfstate`. For production, configure TFC backend in `main.tf`:

```hcl
cloud {
  organization = "Vernify"
  workspaces {
    name = "sec01"
  }
}
```

Then `terraform login` and push state to TFC.
