data "azurerm_mssql_server" "datasrver" {
    for_each = var.sqldb
  name                = each.value.sqlserver_name
  resource_group_name = each.value.rg_name
}
