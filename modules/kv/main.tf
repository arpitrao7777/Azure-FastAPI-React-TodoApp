data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "kv_rg" {
  for_each = var.kv_rg_names
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_key_vault" "kv" {
  depends_on                  = [azurerm_resource_group.kv_rg]
  for_each                    = var.kv_names
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
