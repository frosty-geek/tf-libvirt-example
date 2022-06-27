data "template_file" "userdata" {
  template = file("${path.module}/userdata")
  vars = {
    hostname       = var.hostname
    domainname     = var.domainname
    username       = var.username
    ssh_public_key = file(var.ssh_public_key)
  }
}

#data template_file "metadata" {
#  template = file("${path.module}/metadata")
#  vars = {
#    dhcp        = var.dhcp
#    hostname    = var.hostname_prefix
#    ip_address  = var.ip_address
#    netmask     = var.netmask
#    nameservers = jsonencode(var.nameservers)
#    gateway     = var.gateway
#  }
#}

#data template_file "networkconfig" {
#  template = file("${path.module}/networkconfig")
#  vars = {
#    dhcp        = var.dhcp
#    hostname    = var.hostname_prefix
#    ip_address  = var.ip_address
#    netmask     = var.netmask
#    nameservers = jsonencode(var.nameservers)
#    gateway     = var.gateway
#  }
#}
