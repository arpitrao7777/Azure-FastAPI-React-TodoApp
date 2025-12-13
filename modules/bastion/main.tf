resource "azurerm_virtual_network" "vnet_bastion" {
  for_each            = var.bastion_vnet_names
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet" "subnet_bastion" {
  depends_on           = [azurerm_virtual_network.vnet_bastion]
  for_each             = var.bastion_names
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "pip1" {
  for_each            = var.bastion_names
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion_names
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet_bastion[each.key].id
    public_ip_address_id = azurerm_public_ip.pip1[each.key].id
  }
}
