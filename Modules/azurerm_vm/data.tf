data "azurerm_network_interface" "datanic" {
    for_each = var.vm
  name                = each.value.nic_name
  resource_group_name =  each.value.rg_name
}

data "azurerm_key_vault_secret" "dataseret" {
    for_each = var.vm
  name         = each.value.user_name
  key_vault_id = data.azurerm_key_vault.data-keyvault[each.key].id
}

data "azurerm_key_vault_secret" "datapass" {
    for_each = var.vm
  name         = each.value.pass_name
  key_vault_id = data.azurerm_key_vault.data-keyvault[each.key].id
}
data "azurerm_key_vault" "data-keyvault" {
    for_each = var.vm
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}
