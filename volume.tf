resource "libvirt_volume" "vm-volume-base" {
  name   = "${var.hostname}-${var.image_release}-base.${var.volume_format}"
  source = replace(var.image_url, "%RELEASE%", var.image_release)
  pool   = var.volume_pool
  format = var.volume_format
}

resource "libvirt_volume" "vm-volume-root" {
  name           = "${var.hostname}-root.${var.volume_format}"
  pool           = var.volume_pool
  format         = var.volume_format
  size           = var.volume_size_root
  base_volume_id = libvirt_volume.vm-volume-base.id
}

resource "libvirt_volume" "vm-volume-data" {
  count  = var.volume_data_enabled ? 1 : 0
  name   = "${var.hostname}-data.${var.volume_format}"
  pool   = var.volume_pool
  format = var.volume_format
  size   = var.volume_size_data
}
