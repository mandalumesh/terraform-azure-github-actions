resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
    for_each = var.nsgassociation
  subnet_id                 = data.azurerm_subnet.datasubnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.datansg[each.key].id
}

