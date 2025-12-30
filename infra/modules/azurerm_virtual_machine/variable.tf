variable "vms" {
  description = "A map of virtual machine configurations"
  type = map(object({
    vnet_name            = string
    subnet_name         = string
    nic_name            = string
    nsg_name            = string
    pip_name            = string
    vm_name             = string
    resource_group_name = string
    location            = string
    address_space       = map(string)
    vm_size             = string
    admin_username      = string
    admin_password      = string
  }))
}