module "rg" {
  source = "../../Modules/azurerm_rg"
  rg     = var.dev-rg
}
module "stg" {
  source     = "../../Modules/azurerm_storage_account"
  stg        = var.dev-stg
  depends_on = [module.rg]
}
module "container" {
  source     = "../../Modules/azurerm_storage_container"
  container  = var.dev-container
  depends_on = [module.stg]
}
# module "vnet" {
#   source     = "../../Modules/azurerm_vnet"
#   vnet       = var.dev-vnet
#   depends_on = [module.rg]
# }
# module "subnet" {
#   source     = "../../Modules/azurerm_subnet"
#   subnet     = var.dev-subnet
#   depends_on = [module.vnet]
# }
# module "nic" {
#   source     = "../../Modules/azurerm_nic"
#   nic        = var.dev-nic
#   depends_on = [module.subnet]
# }
# module "keyvault" {
#   source     = "../../Modules/azurerm_keyvault"
#   keyvault   = var.dev-keyvault
#   depends_on = [module.nic]
# }
# module "keyvault_secret" {
#   source     = "../../Modules/azurerm_keyvault_secret"
#   secret     = var.dev-keyvault-secret
#   depends_on = [module.keyvault]
# }
# module "vm" {
#   source     = "../../Modules/azurerm_vm"
#   vm         = var.dev-vm
#   depends_on = [module.keyvault_secret]
# }
# module "pip" {
#   source     = "../../Modules/azurerm_pip"
#   pip        = var.dev-pip
#   depends_on = [module.vm]
# }
# module "bastion" {
#   source     = "../../Modules/azurerm_bastion"
#   bastion    = var.dev-bastion
#   depends_on = [module.pip]
# }
# module "nsg" {
#   source     = "../../Modules/azurerm_nsg"
#   nsg        = var.dev-nsg
#   depends_on = [module.bastion]
# }
# module "nsg-association" {
#   source         = "../../Modules/azurerm_nsg_association"
#   nsgassociation = var.dev-nsg-aassociation
#   depends_on     = [module.nsg]
# }
# module "sqlserver" {
#   source     = "../../Modules/azurerm_sql_server"
#   sqlserver  = var.dev-sqlserver
#   depends_on = [module.nsg-association]

# }
# module "sqldb" {
#   source     = "../../Modules/azurerm_sql_db"
#   sqldb      = var.dev-sqldb
#   depends_on = [module.sqlserver]
# }

# module "appgw" {
#   source     = "../../Modules/azurerm_application_gateway"
#   appw       = var.dev-appgw
#   depends_on = [module.sqldb]
# }

# module "acr" {
#   source     = "../../Modules/azurerm_ACR"
#   acr        = var.dev-acr
#   depends_on = [module.appgw]

# }

# module "aks" {
#   source     = "../../Modules/azurerm_AKS"
#   aks        = var.dev-aks
#   depends_on = [module.acr]

# }