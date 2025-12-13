module "rg" {
  source   = "../../modules/rg"
  rg_names = var.rg_names
}

# module "stg" {
#   depends_on = [module.rg]
#   source     = "../../modules/stg"
#   stg_names  = var.stg_names
# }

# module "vnet" {
#   depends_on = [module.rg]
#   source     = "../../modules/vnet"
#   vnet_names = var.vnet_names
# }

# module "subnet" {
#   depends_on   = [module.vnet, module.rg]
#   source       = "../../modules/subnet"
#   subnet_names = var.subnet_names
# }

# module "db_server" {
#   depends_on      = [module.rg]
#   source          = "../../modules/db_server"
#   db_server_names = var.db_server_names
# }

# module "db" {
#   depends_on = [module.rg, module.db_server]
#   source     = "../../modules/db"
#   db_names   = var.db_names
# }

# module "acr" {
#   depends_on = [module.rg]
#   source     = "../../modules/acr"
#   acr_names  = var.acr_names
# }

# module "kv" {
#   depends_on  = [module.rg]
#   source      = "../../modules/kv"
#   kv_rg_names = var.kv_rg_names
#   kv_names    = var.kv_names
# }

# module "bastion" {
#   depends_on         = [module.rg]
#   source             = "../../modules/bastion"
#   bastion_vnet_names = var.bastion_vnet_names
#   bastion_names      = var.bastion_names
# }

# module "aks" {
#   depends_on = [module.rg]
#   source     = "../../modules/aks"
#   aks_names  = var.aks_names
# }

# module "vm" {
#   depends_on = [module.rg, module.vnet, module.subnet]
#   source     = "../../modules/vm"
#   vm_names   = var.vm_names
# }


# module "lb" {
#   depends_on = [module.rg, module.vnet, module.subnet]
#   source     = "../../modules/lb"
# }