terraform {
  required_version = ">= 1.1.7"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.6.14"
    }
  }
}

provider "libvirt" {
  uri = var.libvirt_uri
}
