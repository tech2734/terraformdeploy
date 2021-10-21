variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "datacenter" {
  description = "vSphere data center"
  type        = string
}

variable "cluster" {
  description = "vSphere cluster"
  type        = string
}

variable "datastore" {
  description = "vSphere datastore"
  type        = string
}

variable "network_name" {
  description = "vSphere network name"
  type        = string
}

variable "vm_template_name" {
  description = "RHEL Template name (ie: image_path)"
  type        = string
}

variable "vmguest_domain" {
  description = "VM Guest domain name"
  type        = string
}

variable "vmguest_netmask" {
  description = "VM Guest netmask"
  type        = string
}

variable "vmguest_gateway" {
  description = "VM Guest gateway"
  type        = string
}

variable "vm_os_disk" {
  description = "VM Guest OS disk"
  type        = string
}

variable "vm_cpu_count" {
  description = "VM Guest CPU count"
  type        = string
}

variable "vm_memory" {
  description = "VM Guest memory"
  type        = string
}

variable "vm_guest_id" {
  description = "VM Guest ID"
  type        = string
}

variable "vm_firmware" {
  description = "VM Guest firmware, efi or bios"
  type        = string
}

variable "instance_data" {
  description = "declare hostname and static IP"
  type        = any
}

variable "instance_disks" {
  description = "declare additional disks"
  type        = any
}