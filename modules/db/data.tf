data "azurerm_mssql_server" "db_server2" {
  for_each = var.db_names
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}