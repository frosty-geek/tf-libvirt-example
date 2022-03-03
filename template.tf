data "template_file" "user_data" {
  template = file("${path.module}/../user-data.yml")
  vars = {
    hostname = var.hostname
    fqdn     = "${var.hostname}.${var.domain}"
    chroot   = var.vm_id
    swap     = var.swap_size
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/../network_config.yml")
  vars = {
    ip4 = var.ip4
    gw4 = var.gw4
  }
}
