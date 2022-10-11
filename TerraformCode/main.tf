provider "azurerm" {
  features {}
}


module "SingleStack" {
  name = "Demo-Azure"
  name_vnet     = "Demo-Vnet"
  #source   = "https://terraformstatefordemo05.blob.core.windows.net/modules/236/RG.zip"
  source = "../../Modules/SingleStack"
  address_space = ["10.0.0.0/16"]
  location = "East US"
  #Subnet
  backend_prefix = ["10.0.1.0/24"]
  backend_prefix2 = ["10.0.2.0/24"]
  frontend_prefix = ["10.0.3.0/24"]
  frontend = "App_gateway_frontend"
  backend1 = "WindowsVM-BLogic"
  backend2 = "Database-Logic"
  pubip = "public-ip"
  allocation = var.allocation[1]
  # local.backend_address_pool_name = 
  # local.frontend_port_name = 
  # frontend_ip_configuration_name = 
  # http_setting_name = 
  #APPGW
  protocol = var.protocol[0]
  appgw = var.appgwname
  capacity = var.capacity
  vnet-sub = var.vnet-sub
  rule_type = var.rule_type[0]
  skuname = var.skuname[0]
  request_timeout = var.request_timeout
  tier = var.tier[0]
  port = var.port[0]
  }
  
