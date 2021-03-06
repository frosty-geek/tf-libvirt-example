resource "libvirt_domain" "vm" {
  name      = var.hostname
  memory    = var.vram
  vcpu      = var.vcpu
  autostart = var.autostart
  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  #cpu = {
  #  mode = "host-passthrough"
  #}
  disk {
    volume_id = libvirt_volume.vm-volume-root.id
  }
  boot_device {
    dev = ["hd", "network"]
  }
  dynamic "network_interface" {
    for_each = var.networks
    content {
      bridge = network_interface.value
    }
  }
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
