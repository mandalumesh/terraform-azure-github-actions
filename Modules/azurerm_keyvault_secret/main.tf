resource "azurerm_key_vault_secret" "keyvault_user" {
    for_each = var.secret
  name         = each.value.user_name
  value        = each.value.user_value
  key_vault_id = data.azurerm_key_vault.data-keyvault[each.key].id
}

resource "azurerm_key_vault_secret" "keyvault_password" {
    for_each = var.secret
  name         = each.value.pass_name
  value        = each.value.pass_value
  key_vault_id = data.azurerm_key_vault.data-keyvault[each.key].id
}