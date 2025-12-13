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
