resource "azurerm_mssql_server" "database_server" {
  for_each                     = var.mysql_db
  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.admin_username
  administrator_login_password = each.value.admin_password
  minimum_tls_version          = "1.2"

  lifecycle {
    prevent_destroy = true
  }
}


resource "azurerm_mssql_database" "database" {
  for_each     = var.mysql_db
  name         = each.value.db_name
  server_id    = azurerm_mssql_server.database_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"

  lifecycle {
    prevent_destroy = true
  }
}
