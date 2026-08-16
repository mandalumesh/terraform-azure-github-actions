data "azurerm_storage_account" "datastg" {
    for_each = var.container
  name                = each.value.stg_name
  resource_group_name = each.value.rg_name
}
