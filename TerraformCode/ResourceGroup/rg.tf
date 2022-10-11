provider "azurerm" {
  features {}
}

module "demo" {
  name     = "Demo-Azure"
  source   = "https://terraformstatefordemo05.blob.core.windows.net/modules/236/RG.zip"
  location = "East US"
    tags = {
    "Env"       = "dev",
    "Namespace" = "Demo",
    "Owner"     = "Jefferson"
  }
}



