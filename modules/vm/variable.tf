variable "vm_names" {
  type = map(object({
    nic_name            = string
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    vnet_name           = string
    subnet_name         = string
  }))
}