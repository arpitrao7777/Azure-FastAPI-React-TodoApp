data "azurerm_virtual_network" "vnet2" {
  name                = "dev-rakesh-vnet-1"
  resource_group_name = "dev-rakesh-rg-1"
}
data "azurerm_subnet" "subnet2" {
  name                 = "dev-rakesh-subnet-1"
  virtual_network_name = data.azurerm_virtual_network.vnet2.name
  resource_group_name  = "dev-rakesh-rg-1"
}