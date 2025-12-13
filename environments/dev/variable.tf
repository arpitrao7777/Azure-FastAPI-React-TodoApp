variable "rg_names" {
  type = map(object({
    name     = string
    location = string
  }))
}
variable "stg_names" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}
variable "vnet_names" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = list(string)
  }))
}
variable "subnet_names" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

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
variable "kv_rg_names" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "kv_names" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
variable "db_server_names" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
  }))
}
variable "db_names" {
  type = map(object({
    name                = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    server_name         = string
    resource_group_name = string
  }))
}
variable "bastion_vnet_names" {
  type = map(object({
    vnet_name           = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
}

variable "bastion_names" {
  type = map(object({
    subnet_name         = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)
    pip_name            = string
    location            = string
    bastion_name        = string
  }))
}

variable "aks_names" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    dns_prefix          = string
    node_pool_name      = string
    node_count          = number
    vm_size             = string
  }))
}
variable "acr_names" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}