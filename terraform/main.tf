resource "proxmox_vm_qemu" "portofolio-web" {  
  target_node = "pve"
  name = "portofolio-web"
  vmid = 102
  clone = "ubuntu-jammy"
  full_clone = true

  os_type = "cloud_init"
  cloudinit_cdrom_storage = "local-lvm"

  ciuser = var.ci_user
  cipassword = var.ci_password

  cores = 1
  memory = 1024
  agent = 1

  bootdisk = "scsi0"
  scsihw = "virtio-scsi-pci"
  ipconfig0 = "ip=192.168.0.7/24,gw=192.168.0.1"

  disk {
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [ 
        network
     ]
  }
}


output "portofolio-web-info" {
  value = [
    for web in proxmox_vm_qemu.portofolio-web: {
        hostname = web.name
        ip-addr = web.default_ipv4_address
    }
  ]
}
