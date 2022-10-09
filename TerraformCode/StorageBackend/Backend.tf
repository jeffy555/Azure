resource "azurerm_resource_group" "StorageBackendRg" {
  name     = "StorageBackend"
  location = "East US"
}

resource "azurerm_storage_account" "StorageAccount" {
  name                     = "terraformstatefordemo05"
  resource_group_name      = azurerm_resource_group.StorageBackendRg.name
  location                 = azurerm_resource_group.StorageBackendRg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "Container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.StorageAccount.name
  container_access_type = "private"
}