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