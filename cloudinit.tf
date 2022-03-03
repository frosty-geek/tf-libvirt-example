resource "libvirt_cloudinit_disk" "cloud-init" {
  name           = "cloud-init-${var.hostname}.iso"
  pool           = "default"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
}
