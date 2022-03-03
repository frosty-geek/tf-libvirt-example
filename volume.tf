resource "libvirt_volume" "ubuntu-base" {
  name   = "ubuntu-${var.dist}-${var.hostname}-base.qcow2"
  pool   = "default"
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "ubuntu-vol" {
  name           = "${var.vm_id}__${var.hostname}.qcow2"
  pool           = "vm_images"
  base_volume_id = libvirt_volume.ubuntu-base.id
  size           = var.vol_size
}

resource "libvirt_volume" "data" {
  count = var.data_enable ? 1 : 0

  name          = "${var.vm_id}__${var.hostname}-data.qcow2"
  pool          = "vm_images"
  size          = var.data
}
