rgs = {
  rg-1 = {
    name     = "test"
    location = "North Europe"
  }
}

mysql_db = {
  db-1 = {
    server_name         = "test32971"
    resource_group_name = "test"
    location            = "North Europe"
    admin_username      = "mysqladmin"
    admin_password      = "SecureP@ssw0rd!"
    db_name             = "testerdb1"
    max_size_gb         = 10
  }
}

vms = {
  vm-1 = {
    vm_name              = "vm-1"
    vm_size              = "Standard_D2s_v3"
    admin_username       = "adminuser1"
    admin_password       = "Arpitrao7777"
    location             = "North Europe"
    resource_group_name  = "test"
    vnet_name            = "vnet-1"
    subnet_name          = "subnet-1"
    nic_name             = "nic-1"
    pip_name             = "pip-1"
    nsg_name             = "nsg-1"
    address_space        = ["10.0.0.0/16"]
  }
}