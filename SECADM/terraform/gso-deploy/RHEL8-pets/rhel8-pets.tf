module "rhel8-std-pets" {
    source = "../modules/rhel8-std-pets"

    ## VMware configuration variables
    datacenter          = "Practice_Lab"
    datastore           = "pool0-ceph-vsphere"
    cluster             = "Production"
    network_name        = "VM Network"
    vm_template_name    = "jbrhel8clone1"


    ## VM Guest configuration variables

    instance_data = [
      {
        vmguest_hostname    = "newserver1"
        vmguest_ip_address  = "10.1.196.122"
      },

      {
        vmguest_hostname    = "newserver2"
        vmguest_ip_address  = "10.1.196.123"
      }
    ]

    instance_disks = [
      {
        disk_size = "5"
      },

      {
        disk_size = "15"
      }
    ]

    ## VM instance network
    vmguest_domain      = "practice.redhat.com"
    vmguest_netmask     = 24
    vmguest_gateway     = "10.1.196.254"

    ## VM instance resources
    vm_cpu_count = "2"
    ## memory size in MB
    vm_memory    = "2048"
    ## disk size in GB
    vm_os_disk   = "30"
    vm_guest_id  = "rhel8_64Guest"
    vm_firmware  = "bios"
}