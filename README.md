# tf-libvirt-example

A simple way to spawn ubuntu VMs


## minimal variables needed

```bash
$ cat <EOF > terraform.tfvars 
servername = "server1"
domainname = "example.com"
EOF
```


## Update terraform-docs 

```bash
$ terraform-docs markdown table --output-file README.md --output-mode inject .
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | >= 0.6.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.6.14 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.cloudinit](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.vm](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/domain) | resource |
| [libvirt_volume.vm-volume-base](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.vm-volume-data](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.vm-volume-root](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [template_file.userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autostart"></a> [autostart](#input\_autostart) | autostart vm (default false) | `bool` | `false` | no |
| <a name="input_domainname"></a> [domainname](#input\_domainname) | domainname used to generate fqdn for cloud-init | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | hostname used in filenames + cloud-init | `string` | n/a | yes |
| <a name="input_image_release"></a> [image\_release](#input\_image\_release) | image release name used in filenames + image\_url regex replace (default focal) | `string` | `"focal"` | no |
| <a name="input_image_url"></a> [image\_url](#input\_image\_url) | cloud-images URL %RELEASE% will be regex replaced with $image\_release (default ubuntu cloud-images) | `string` | `"https://cloud-images.ubuntu.com/%RELEASE%/current/%RELEASE%-server-cloudimg-amd64.img"` | no |
| <a name="input_libvirt_uri"></a> [libvirt\_uri](#input\_libvirt\_uri) | libvirt connection uri | `string` | `"qemu:///system"` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | list of network bridges to attach to (default virbr0) | `list(string)` | <pre>[<br>  "virbr0"<br>]</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | ssh public keyfile for cloud-init (default ~/.ssh/id\_rsa.pub) | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_username"></a> [username](#input\_username) | username for cloud-init | `string` | `"ubuntu"` | no |
| <a name="input_vcpu"></a> [vcpu](#input\_vcpu) | vCPUs of the VM (default 1) | `number` | `1` | no |
| <a name="input_volume_data_enabled"></a> [volume\_data\_enabled](#input\_volume\_data\_enabled) | volume for data disk enabled? (default false) | `bool` | `false` | no |
| <a name="input_volume_format"></a> [volume\_format](#input\_volume\_format) | volume file format, used for cloud-images + local files (default qcow2) | `string` | `"qcow2"` | no |
| <a name="input_volume_pool"></a> [volume\_pool](#input\_volume\_pool) | volume pool to save local files to (default default) | `string` | `"default"` | no |
| <a name="input_volume_size_data"></a> [volume\_size\_data](#input\_volume\_size\_data) | volume size for data disk (default 50GB) | `number` | `53687091200` | no |
| <a name="input_volume_size_root"></a> [volume\_size\_root](#input\_volume\_size\_root) | volume size for root disk (default 10GB) | `number` | `10737418240` | no |
| <a name="input_vram"></a> [vram](#input\_vram) | RAM of the VM (default 2GB) | `number` | `2048` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
