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
  count      = length(var.container)
  name                  = var.container[count.index]
  storage_account_name  = azurerm_storage_account.StorageAccount.name
  container_access_type = "container"
}

resource "azurerm_key_vault" "example" {
  name                        = "Secretstoragedemo05"
  location                    = "East US"
  resource_group_name         = "StorageBackend"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}