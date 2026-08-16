resource "azurerm_container_registry" "acr" {
    for_each = var.acr
  name                = each.value.acr_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = "Basic"
  admin_enabled       = false
  
#   georeplications {
#     location                = "East US"
#     zone_redundancy_enabled = false
#     tags                    = {}
#   }
#   georeplications {
#     location                = "North Europe"
#     zone_redundancy_enabled = false
#     tags                    = {}
#   }
}