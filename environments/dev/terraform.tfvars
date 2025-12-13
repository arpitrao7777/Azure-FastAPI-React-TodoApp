rg_names = {
  rg_1 = {
    name     = "dev-rakesh-rg-1"
    location = "Central India"
  }
}
stg_names = {
  stg1 = {
    name                = "devrakeshstg1"
    resource_group_name = "dev-rakesh-rg-1"
    location            = "Central India"
  }
}
vnet_names = {
  vnet1 = {
    name                = "dev-rakesh-vnet-1"
    resource_group_name = "dev-rakesh-rg-1"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
  }
}
subnet_names = {
  subnet1 = {
    name                 = "dev-rakesh-subnet-1"
    resource_group_name  = "dev-rakesh-rg-1"
    virtual_network_name = "dev-rakesh-vnet-1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

vm_names = {
  vm1 = {
    nic_name            = "dev-rakesh-nic-1"
    name                = "dev-rakesh-vm-1"
    location            = "Central India"
    resource_group_name = "dev-rakesh-rg-1"
    size                = "Standard_B1ms"
    admin_username      = "adminuser"
    admin_password      = "P@ssw0rd1234"
    vnet_name           = "dev-rakesh-vnet-1"
    subnet_name         = "dev-rakesh-subnet-1"
  }
}
kv_rg_names = {
  kv_rg1 = {
    name     = "dev-rakesh-kv-rg-1"
    location = "Central India"
  }
}
kv_names = {
  kv1 = {
    name                = "dev-rakesh-kv-1"
    location            = "Central India"
    resource_group_name = "dev-rakesh-kv-rg-1"
  }
}
db_server_names = {
  db_server1 = {
    name                         = "dev-rakesh-db-server-1"
    resource_group_name          = "dev-rakesh-rg-1"
    location                     = "Central India"
    administrator_login          = "adminuser"
    administrator_login_password = "P@ssw0rd1234"
  }
}
db_names = {
  db1 = {
    name                = "dev-rakesh-database-1"
    max_size_gb         = 2
    sku_name            = "Basic"
    enclave_type        = "VBS"
    server_name         = "dev-rakesh-db-server-1"
    resource_group_name = "dev-rakesh-rg-1"
  }
}
bastion_vnet_names = {
  bas_vnet1 = {
    vnet_name           = "dev-rakesh-bastion-vnet-1"
    resource_group_name = "dev-rakesh-rg-1"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]
  }
}

bastion_names = {
  bas1 = {
    subnet_name         = "AzureBastionSubnet"
    resource_group_name = "dev-rakesh-rg-1"
    vnet_name           = "dev-rakesh-bastion-vnet-1"
    address_prefixes    = ["10.0.1.0/24"]
    pip_name            = "dev-rakesh-bastion-pip-1"
    location            = "Central India"
    bastion_name        = "dev-rakesh-bastion-1"
  }
}
aks_names = {
  aks1 = {
    name                = "devrakeshaks1"
    location            = "Central India"
    resource_group_name = "dev-rakesh-rg-1"
    dns_prefix          = "devrakeshaks1"
    node_pool_name      = "devndpool1"
    node_count          = 1
    vm_size             = "standard_d16ads_v5"
  }
}
acr_names = {
  acr1 = {
    name                = "devrakeshacr1"
    location            = "Central India"
    resource_group_name = "dev-rakesh-rg-1"
  }
}
