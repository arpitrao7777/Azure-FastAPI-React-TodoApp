variable "rgs" {
  description = "A map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}


variable "mysql_db" {
  description = "A map of databases to create."
  type = map(object({
    server_name         = string
    resource_group_name = string
    location            = string
    admin_username      = string
    admin_password      = string
    db_name             = string
    max_size_gb         = number
  }))
}

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