resource "azurerm_mssql_server" "server" {
  for_each                     = var.sqlserver
  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  azuread_administrator {
    login_username = each.value.login_username
    object_id      = each.value.object_id
  }
}
