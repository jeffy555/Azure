terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatefordemo05"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate"
    subscription_id      = "__subid__"
    tenant_id            = "__tenantid__"
  }
}