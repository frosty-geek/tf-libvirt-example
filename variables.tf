variable "libvirt_uri" {
  type        = string
  default     = "qemu:///system"
  description = "libvirt connection uri"
}
variable "image_url" {
  type        = string
  default     = "https://cloud-images.ubuntu.com/%RELEASE%/current/%RELEASE%-server-cloudimg-amd64.img"
  description = "cloud-images URL %RELEASE% will be regex replaced with $image_release (default ubuntu cloud-images)"
}
variable "image_release" {
  type        = string
  default     = "focal"
  description = "image release name used in filenames + image_url regex replace (default focal)"
}
variable "hostname" {
  type        = string
  description = "hostname used in filenames + cloud-init"
}
variable "domainname" {
  type        = string
  description = "domainname used to generate fqdn for cloud-init"
}
variable "username" {
  type        = string
  default     = "ubuntu"
  description = "username for cloud-init"
}
variable "ssh_public_key" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "ssh public keyfile for cloud-init (default ~/.ssh/id_rsa.pub)"
}
variable "networks" {
  type        = list(string)
  default     = ["virbr0"]
  description = "list of network bridges to attach to (default virbr0)"
}
variable "vram" {
  type        = number
  default     = 2 * 1024
  description = "RAM of the VM (default 2GB)"
}
variable "vcpu" {
  type        = number
  default     = 1
  description = "vCPUs of the VM (default 1)"
}
variable "volume_format" {
  type        = string
  default     = "qcow2"
  description = "volume file format, used for cloud-images + local files (default qcow2)"
}
variable "volume_pool" {
  type        = string
  default     = "default"
  description = "volume pool to save local files to (default default)"
}
variable "volume_size_root" {
  type        = number
  default     = 10 * 1024 * 1024 * 1024
  description = "volume size for root disk (default 10GB)"
}
variable "volume_data_enabled" {
  type        = bool
  default     = false
  description = "volume for data disk enabled? (default false)"
}
variable "volume_size_data" {
  type        = number
  default     = 50 * 1024 * 1024 * 1024
  description = "volume size for data disk (default 50GB)"
}
variable "autostart" {
  type        = bool
  default     = false
  description = "autostart vm (default false)"
}
