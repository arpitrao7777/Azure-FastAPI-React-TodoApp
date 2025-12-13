resource "azurerm_mssql_database" "db" {
  for_each     = var.db_names
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.db_server2[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
