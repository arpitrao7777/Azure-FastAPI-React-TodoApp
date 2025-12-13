data "azurerm_subnet" "subnet2" {
  for_each             = var.vm_names
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}
