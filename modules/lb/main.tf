resource "azurerm_public_ip" "pip1" {
  name                = "dev-rakesh-lb-pip-1"
  location            = "East US"
  resource_group_name = "dev-rakesh-rg-1"
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "nic1" {
  name                = "dev-rakesh-lb-nic-1"
  location            = "East US"
  resource_group_name = "dev-rakesh-rg-1"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb" "lb" {
  name                = "dev-rakesh-LoadBalancer"
  location            = "East US"
  resource_group_name = "dev-rakesh-rg-1"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip1.id
  }
}

resource "azurerm_lb_backend_address_pool" "netflixpool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "nics" {
  network_interface_id    = azurerm_network_interface.nic1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.netflixpool.id
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "ssh-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.netflixpool.id]
}
