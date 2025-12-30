module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "db_database" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_database"
  mysql_db   = var.mysql_db
}

module "vm" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}
