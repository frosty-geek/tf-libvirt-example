resource "libvirt_cloudinit_disk" "cloudinit" {
  name      = "${var.hostname}-cloud-init.iso"
  pool      = var.volume_pool
  user_data = data.template_file.userdata.rendered
  #meta_data = data.template_file.metadata.rendered
  #network_config = data.template_file.networkconfig.rendered
}
