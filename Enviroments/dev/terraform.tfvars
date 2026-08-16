dev-rg = {
  rg-01 = {
    rg_name  = "rg-streamflix-dev"
    location = "central india"
  }
}

dev-stg = {
  stg-01 = {
    stg_name                 = "stdiagdevstream01"
    rg_name                  = "rg-streamflix-dev"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

dev-container = {
  con-01 = {
    container_name        = "containerstream"
    container_access_type = "private"
    stg_name              = "stdiagdevstream01"
    rg_name               = "rg-streamflix-dev"
  }
}

dev-vnet = {
  vnet-01 = {
    vnet_name     = "vnet-streamflix-01"
    location      = "central india"
    rg_name       = "rg-streamflix-dev"
    address_space = ["10.0.0.0/16"]
  }
}

dev-subnet = {
  subnet-01 = {
    subnet_name      = "snet-web-dev"
    rg_name          = "rg-streamflix-dev"
    vnet_name        = "vnet-streamflix-01"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet-02 = {
    subnet_name      = "snet-app-dev"
    rg_name          = "rg-streamflix-dev"
    vnet_name        = "vnet-streamflix-01"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet-03 = {
    subnet_name      = "snet-db-dev"
    rg_name          = "rg-streamflix-dev"
    vnet_name        = "vnet-streamflix-01"
    address_prefixes = ["10.0.3.0/24"]
  }
  subnet-04 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "rg-streamflix-dev"
    vnet_name        = "vnet-streamflix-01"
    address_prefixes = ["10.0.4.0/24"]
  }
  subnet-05 = {
    subnet_name      = "snet-appgw-dev"
    rg_name          = "rg-streamflix-dev"
    vnet_name        = "vnet-streamflix-01"
    address_prefixes = ["10.0.5.0/24"]
  }
  subnet-06 = {
    subnet_name      = "private_endpoint_subnet"
    rg_name          = "rg-streamflix-dev"
    vnet_name        = "vnet-streamflix-01"
    address_prefixes = ["10.0.6.0/24"]
  }
}

dev-nic = {
  nic-01 = {
    nic_name                      = "nic-web-dev"
    location                      = "central india"
    rg_name                       = "rg-streamflix-dev"
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "snet-web-dev"
    vnet_name                     = "vnet-streamflix-01"
  }
  nic-02 = {
    nic_name                      = "nic-app-dev"
    location                      = "central india"
    rg_name                       = "rg-streamflix-dev"
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "snet-app-dev"
    vnet_name                     = "vnet-streamflix-01"
  }
}

dev-keyvault = {
  keyvault = {
    keyvault_name               = "kv-streamflix-dev05"
    location                    = "central india"
    rg_name                     = "rg-streamflix-dev"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

dev-keyvault-secret = {
  keyvault_secret = {
    user_name     = "dev-secret"
    user_value    = "azurevm"
    pass_name     = "dev-password"
    pass_value    = "Azure@12345"
    keyvault_name = "kv-streamflix-dev05"
    rg_name       = "rg-streamflix-dev"

  }
}
dev-vm = {
  vm-01 = {
    vm_name                         = "vm-web-01-dev"
    rg_name                         = "rg-streamflix-dev"
    location                        = "central india"
    size                            = "Standard_F2"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "nic-web-dev"
    keyvault_name                   = "kv-streamflix-dev05"
    user_name                       = "dev-secret"
    pass_name                       = "dev-password"
  }
  vm-02 = {
    vm_name                         = "vm-app-01-dev"
    rg_name                         = "rg-streamflix-dev"
    location                        = "central india"
    size                            = "Standard_F2"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "nic-app-dev"
    keyvault_name                   = "kv-streamflix-dev05"
    user_name                       = "dev-secret"
    pass_name                       = "dev-password"
  }
}
dev-pip = {
  pip-01 = {
    pip_name          = "bastion-dev-pip"
    rg_name           = "rg-streamflix-dev"
    location          = "central india"
    allocation_method = "Static"
  }
  pip-02 = {
    pip_name          = "agw-dev-pip"
    rg_name           = "rg-streamflix-dev"
    location          = "central india"
    allocation_method = "Static"
  }
}
dev-bastion = {
  bastion = {
    bastion_name = "bas-streamflix-01"
    location     = "central india"
    rg_name      = "rg-streamflix-dev"
    ip_name      = "web-ip-config"
    subnet_name  = "AzureBastionSubnet"
    vnet_name    = "vnet-streamflix-01"
    pip_name     = "bastion-dev-pip"
  }
}
dev-nsg = {
  nsg-01 = {
    nsg_name = "nsg-web-dev"
    location = "central india"
    rg_name  = "rg-streamflix-dev"
  }

  nsg-02 = {
    nsg_name = "nsg-app-dev"
    location = "central india"
    rg_name  = "rg-streamflix-dev"
  }
}
dev-nsg-aassociation = {
  nsg-aassociation-01 = {
    subnet_name = "snet-web-dev"
    vnet_name   = "vnet-streamflix-01"
    rg_name     = "rg-streamflix-dev"
    nsg_name    = "nsg-web-dev"
  }
  nsg-aassociation-02 = {
    subnet_name = "snet-app-dev"
    vnet_name   = "vnet-streamflix-01"
    rg_name     = "rg-streamflix-dev"
    nsg_name    = "nsg-app-dev"
  }
}

dev-sqlserver = {
  server-01 = {
    sqlserver_name               = "sql-streamflix-dev"
    rg_name                      = "rg-streamflix-dev"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "Azure@12345"
    minimum_tls_version          = "1.2"
    login_username               = "Umesh Mandal"
    object_id                    = "ab6713b3-9cc8-4337-bd65-957540ca2991"
  }
}

dev-sqldb = {
  db-01 = {
    sqldb_name     = "db-streamflix-dev"
    sqlserver_name = "sql-streamflix-dev"
    rg_name        = "rg-streamflix-dev"
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 2
    sku_name       = "S0"
    enclave_type   = "VBS"
  }
}
dev-appgw = {
  appgw-01 = {
    appgw_name  = "appagw-web-dev"
    rg_name     = "rg-streamflix-dev"
    subnet_name = "snet-appgw-dev"
    vnet_name   = "vnet-streamflix-01"
    location    = "central india"
    pip_name    = "agw-dev-pip"
    nic_name    = "nic-app-dev"
  }
}

dev-acr = {
  acr-1 = {
    acr_name = "3tireakrRegistry1"
    location = "central india"
    rg_name  = "rg-streamflix-dev"
  }
}

dev-aks = {
  aks-01 = {
    aks_name = "3tierakscluster"
    location = "central india"
    rg_name  = "rg-streamflix-dev"
  }

}
