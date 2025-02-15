terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}


provider "proxmox" {
  pm_api_url      = "https://192.168.0.2:8006/api2/json"
  pm_api_token_id = var.token_id
  # References our secrets.tfvars to plug in our token_secret
  pm_api_token_secret = var.token_secret
  pm_tls_insecure     = true
}

#### 2 node

resource "proxmox_vm_qemu" "k3sup-node" {
  #description = "Managed by Terraform for K0S"
  tags        = "ks0"
  count       = 2                                           # Adjust for the number of VMs
  vmid        = 7002 + count.index                          # VM ID starts from 8902 and increments
  name        = "k0s-node-${count.index + 1}"             # Unique VM name per instance
  target_node = "pve"                                       # Name of the Proxmox node where VM will be created
  clone       = "k3sup-template-V3"                         # Clone from the working template you already created
  full_clone  = true                                        # Ensure it's a full clone, not linked
  cores       = 2                                           # Number of CPU cores
  sockets     = 1                                           # Number of CPU sockets
  cpu         = "host"                                      # Use host CPU features
  memory      = 2048                                        # RAM size (MB)
  agent       = 1                                           # Enable the QEMU agent
  # Disk configuration
  disk {
    slot    = "virtio0"                                     # Attach the cloned disk to virtio0 (same as in your script)
    size    = "10G"                                         # Disk size (match your image size)
    storage = "local-lvm"                                   # Storage location
    type    = "disk"                                        # Disk type
  }
  # Cloud-init configuration (add cloud-init disk to ide2)
  disk {
    slot    = "ide2"                                        # Cloud-init disk on ide2
    type    = "cloudinit"                                   # Type is cloudinit
    storage = "local-lvm"                                   # Storage location
  }
  # Boot order: boot from the virtio0 disk
  boot        = "order=virtio0"
  # Network configuration
  network {
    model  = "virtio"                                       # Use virtio network model
    bridge = "vmbr0"                                        # Attach to the Proxmox network bridge (match your setup)
  }
# Serial and VGA settings (matches your script)
  serial {
    id    = 0
    type  = "socket"
  }
  vga {
    type  = "serial0"
  }
  # Cloud-init IP configuration (use DHCP for the IP assignment)
  ipconfig0 = "ip=dhcp"
  # Apply the cloud-init configuration
  cicustom = "vendor=local:snippets/k3sup_kube-V3.yaml"      # Cloud-init configuration file (ensure this is correct)
  # Set additional cloud-init options
  ciuser      = "ubuntu"                                     # Username for the VM
  cipassword  = "ubuntu"                                     # Password for the user
  # Enable the VM to start automatically
  onboot = true
}

## 1 master
resource "proxmox_vm_qemu" "k3sup-master" {
  #description = "Managed by Terraform for K0S"
  tags        = "ks0"
  count       = 1                                           # Adjust for the number of VMs
  vmid        = 7004 + count.index                          # VM ID starts from 8902 and increments
  name        = "k0s-master-${count.index + 1}"             # Unique VM name per instance
  target_node = "pve"                                       # Name of the Proxmox node where VM will be created
  clone       = "k3sup-template-V3"                         # Clone from the working template you already created
  full_clone  = true                                        # Ensure it's a full clone, not linked
  cores       = 2                                           # Number of CPU cores
  sockets     = 1                                           # Number of CPU sockets
  cpu         = "host"                                      # Use host CPU features
  memory      = 2048                                        # RAM size (MB)
  agent       = 1                                           # Enable the QEMU agent
  # Disk configuration
  disk {
    slot    = "virtio0"                                     # Attach the cloned disk to virtio0 (same as in your script)
    size    = "10"                                         # Disk size (match your image size)
    storage = "local-lvm"                                   # Storage location
    type    = "disk"                                        # Disk type
  }
  # Cloud-init configuration (add cloud-init disk to ide2)
  disk {
    slot    = "ide2"                                        # Cloud-init disk on ide2
    type    = "cloudinit"                                   # Type is cloudinit
    storage = "local-lvm"                                   # Storage location
  }
  # Boot order: boot from the virtio0 disk
  boot        = "order=virtio0"
  # Network configuration
  network {
    model  = "virtio"                                       # Use virtio network model
    bridge = "vmbr0"                                        # Attach to the Proxmox network bridge (match your setup)
  }
# Serial and VGA settings (matches your script)
  serial {
    id    = 0
    type  = "socket"
  }
  vga {
    type  = "serial0"
  }
  # Cloud-init IP configuration (use DHCP for the IP assignment)
  ipconfig0 = "ip=dhcp"
  # Apply the cloud-init configuration
  cicustom = "vendor=local:snippets/k3sup_kube-V3.yaml"      # Cloud-init configuration file (ensure this is correct)
  # Set additional cloud-init options
  ciuser      = "ubuntu"                                     # Username for the VM
  cipassword  = "ubuntu"                                     # Password for the user
  # Enable the VM to start automatically
  onboot = true
}
