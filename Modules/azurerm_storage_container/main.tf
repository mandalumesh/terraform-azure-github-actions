
resource "azurerm_storage_container" "conatiner" {
    for_each = var.container
  name                  = each.value.container_name
  storage_account_name    = data.azurerm_storage_account.datastg[each.key].name
  container_access_type = each.value.container_access_type
}