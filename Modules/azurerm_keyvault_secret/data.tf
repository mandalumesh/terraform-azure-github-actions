data "azurerm_key_vault" "data-keyvault" {
    for_each = var.secret
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}
