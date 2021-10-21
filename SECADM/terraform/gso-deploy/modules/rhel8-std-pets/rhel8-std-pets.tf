provider "vsphere" {
  #vsphere_server = var.vsphere_server
  #user           = var.vsphere_user
  #password       = var.vsphere_password

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "vm_template" {
  name          = "/${var.datacenter}/vm/${var.vm_template_name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

#### Resource configuration

resource "vsphere_virtual_machine" "rhel8_std_pets" {
  count            = "${length(var.instance_data)}"
  name             = "${var.instance_data[count.index]["vmguest_hostname"]}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vm_cpu_count
  cpu_hot_add_enabled    = true
  memory   = var.vm_memory
  memory_hot_add_enabled = true

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  
  wait_for_guest_net_timeout = -1
  wait_for_guest_ip_timeout  = -1

  disk {
    unit_number = 0
    label            = "osdisk${count.index}""
    thin_provisioned = true
    size             = var.vm_os_disk
  }

  dynamic "disk" {
    for_each = var.instance_disks

    content {
      label             = "datadisk${disk.key + 1}"
      unit_number       = disk.key +1
      size              = disk.value["disk_size"]
      thin_provisioned  = true
    }
  }

  guest_id = var.vm_guest_id
  firmware = var.vm_firmware

  clone {
    template_uuid = data.vsphere_virtual_machine.vm_template.id

    customize {
      linux_options {
        host_name = "$(var.instance_data[count.index]["vmguest_hostname])"
        domain    = var.vmguest_domain
      }

      network_interface {
        ipv4_address = "$(var.instance_data[count.index]["vmguest_ip_address"])"
        ipv4_netmask = var.vmguest_netmask
      }

      ipv4_gateway = var.vmguest_gateway
    }
  }
}
