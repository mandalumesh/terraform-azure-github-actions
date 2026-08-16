data "azurerm_subnet" "datasnet" {
    for_each = var.appw
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "datapip" {
    for_each = var.appw
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "datanic" {
    for_each = var.appw
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
data "azurerm_virtual_network" "datavnet" {

  name                = var.vnet_name
  resource_group_name = var.rg_name
}
