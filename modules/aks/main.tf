resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks_names
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.node_pool_name
    node_count = each.value.node_count
    vm_size    = each.value.vm_size

    upgrade_settings {
    max_surge = "1"
  }
}

  identity {
    type = "SystemAssigned"
  }
}