# terraformdeploy
## **Deploy to VCenter using Terraform**

**Role Description**

This role will create Terraform templates on the Terraform server and then deploy the VM to VCenter

**Required Variables**

```yaml
---
server_name: nameofserver1
server_ip: x.x.x.x
server_gateway: x.x.x.x
domain_name: nameofdomain.com
vsphere_template: nameoftemplate
vsphere_datacenter: nameofdatacenter
vsphere_cluster: nameofcluster
vsphere_network: VM Network
vsphere_datastore: nameofdatastore

```

**Example Playbook Usage**

```yaml
---
- hosts: nameofterraformserver
  gather_facts: false
  tasks:
    - name: import terraformdeploy role
      import_role:
        name: terraform_deploy
```
