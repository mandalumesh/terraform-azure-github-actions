data "azurerm_subnet" "datasubnet" {
    for_each = var.nsgassociation
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_network_security_group" "datansg" {
    for_each = var.nsgassociation
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}