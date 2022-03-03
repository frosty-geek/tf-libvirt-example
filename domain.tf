resource "libvirt_domain" "ubuntu-vm" {
  name      = "${var.vm_id}__${var.hostname}"
  memory    = var.ram
  vcpu      = var.cpu
  autostart = var.autostart

  disk {
    volume_id = libvirt_volume.ubuntu-vol.id
  }

  boot_device {
    dev = ["hd", "network"]
  }

  dynamic "network_interface" {
    for_each = var.network
    content {
      bridge = network_interface.value
    }
  }

  cloudinit = libvirt_cloudinit_disk.cloud-init.id

  console {
    target_type = "serial"
    type        = "pty"
    target_port = "0"
  }
  console {
    target_type = "virtio"
    type        = "pty"
    target_port = "1"
  }
}
