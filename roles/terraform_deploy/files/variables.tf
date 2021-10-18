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

variable "vsphere_template" {
  description = "RHEL Template name (ie: image_path)"
  type        = string
}

variable "server_name" {
  description = "vSphere server name"
  type        = string
}

variable "domain_name" {
  description = "vSphere domain name"
  type        = string
}

variable "server_ip" {
  description = "vSphere server ip address"
  type        = string
}

variable "server_gateway" {
  description = "vSphere server gateway"
  type        = string
}
