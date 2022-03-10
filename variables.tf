variable "libvirt_uri" {
  type    = string
  default = "qemu:///system"
}
variable "image_url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/%RELEASE%/current/%RELEASE%-server-cloudimg-amd64.img"
}
variable "image_release" {
  type    = string
  default = "focal"
}
variable "hostname" {
  type    = string
  default = "server1"
}
variable "domainname" {
  type    = string
  default = "example.com"
}
variable "username" {
  type    = string
  default = "ubuntu"
}
variable "ssh_public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
variable "networks" {
  type    = list(string)
  default = ["virbr0"]
}
variable "vram" {
  type    = number
  default = 2 * 1024
}
variable "vcpu" {
  type    = number
  default = 1
}
variable "volume_format" {
  type    = string
  default = "qcow2"
}
variable "volume_pool" {
  type    = string
  default = "default"
}
variable "volume_size_root" {
  type    = number
  default = 10 * 1024 * 1024 * 1024
}
variable "volume_data_enabled" {
  type    = bool
  default = false
}
variable "volume_size_data" {
  type    = number
  default = 50 * 1024 * 1024 * 1024
}
variable "autostart" {
  type    = bool
  default = false
}
