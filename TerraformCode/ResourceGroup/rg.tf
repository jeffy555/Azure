provider "azurerm" {
  features {}
}

module "demo" {
  name     = "Demo-Azure"
  source   = "https://terraformstatefordemo05.blob.core.windows.net/modules/229/RG.zip"
  location = "East US"
}



