resource "proxmox_vm_qemu" "portofolio-web" {  
  target_node = "pve"
  name = "portofolio-web"
  vmid = 102
  clone = "ubuntu-jammy"
  full_clone = true

  os_type = "cloud_init"
  cloudinit_cdrom_storage = "local-lvm"

  ciuser = var.ci_user
  cipassword = var.cipasswrod
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuhUldRm27ZEpFNQEPn8jQu75/VqlJ9z5JHc1doslj6afvYfWR363FKX/W89zX1fdN1kmxfSa/JnVy58uUp0NW9t3z9uoo7U4WhNxTWu46l59dS5trwcoZ6ELwXE/OorvzZx4IucyInUegRoM8Pi72PN4Ds5SwtjWHh1ue/2T5QsqDi5El9az0zhK/0Gqd3XUG1U1P5Z/yYBBqp3UG+v9lNsCuWwYyt8nE7G1qJ1cMrTHx5TgDTlnYs1QAlXvX4zvt0kvMoOiJxYNcLrplHIHC0AGmOh+v+sHcD9jhIfj51LIhCRbiXW+KcFcr/ZWD8ewiXinRCQsxC2vFq6RgQp2IxvoyudmZpL0cyC9B6WQJpFJtR7Ks3RKiw4bKO4vG3bP5soHWhYjRo/Uc//vVpgEt9suy4UdLm0u6PIIY6Y0uAcfU4HVQWZmePneRXToNkhYJb4aAgPmgfZgIHJcmb/9zjtodoNUw+So6oodKTtxW+QmCbEhRPs1SEzxb+0KIPD0= albadriyano@DESKTOP-4FDEA6O
EOF

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