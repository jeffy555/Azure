resource "azurerm_resource_group" "Rg" {
  name     = var.name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name_vnet
  resource_group_name = azurerm_resource_group.Rg.name
  location            = var.location
  address_space       = var.address_space
  depends_on = [
    azurerm_resource_group.Rg
  ]
}

resource "azurerm_subnet" "frontend" {
  virtual_network_name = azurerm_virtual_network.vnet.name
  name = var.frontend
  resource_group_name = var.name
  address_prefixes     = var.frontend_prefix
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "backend" {
    virtual_network_name = azurerm_virtual_network.vnet.name
  name               = var.backend1
  resource_group_name = var.name
  address_prefixes     = var.backend_prefix
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


resource "azurerm_subnet" "backend-2" {
    virtual_network_name = azurerm_virtual_network.vnet.name
  name = var.backend2
  resource_group_name = var.name
  address_prefixes     = var.backend_prefix2
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_public_ip" "pubip" {
 location            = var.location
  name                = var.pubip
  resource_group_name = var.name
  allocation_method   = var.allocation

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


 locals {
   backend_address_pool_name      = "${var.vnet-sub}-BackendPool"
   frontend_port_name             = "${var.vnet-sub}-FrontEndPort"
   frontend_ip_configuration_name = "${var.vnet-sub}-frontend-config"
   http_setting_name              = "${var.vnet-sub}-http-config"
   listener_name                  = "${var.vnet-sub}-listener"
   request_routing_rule_name      = "${var.vnet-sub}-routing"
   redirect_configuration_name    = "${var.vnet-sub}-redirect"
 }

resource "azurerm_application_gateway" "Appgateway" {
  name                = var.appgw
  resource_group_name = var.name
  location            = var.location

  sku {
    name     = var.skuname
    tier     = var.tier
    capacity = var.capacity
  }

  gateway_ip_configuration {
    name      = "var.gateway-gateway"
    subnet_id = azurerm_subnet.frontend.id
  }

  frontend_port {
    name = "${var.vnet-sub}-frontend-port"
    port = var.port
  }

  frontend_ip_configuration {
    name                 = "${var.vnet-sub}-config-name"
    public_ip_address_id = azurerm_public_ip.pubip.id
  }

  backend_address_pool {
    name = "${var.vnet-sub}-backend-addresspool"
  }

  backend_http_settings {
    name                  = "${var.vnet-sub}-backendsetting"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = var.port
    protocol              = var.protocol
    request_timeout       = var.request_timeout
  }

  http_listener {
    name                           = "${var.vnet-sub}-httplistener"
    frontend_ip_configuration_name = "${var.vnet-sub}-config-name"
    frontend_port_name             = "${var.vnet-sub}-frontend-port"
    protocol                       = var.protocol
  }

  request_routing_rule {
    name                       = "${var.vnet-sub}-request-routing"
    rule_type                  = var.rule_type
    http_listener_name         = "${var.vnet-sub}-httplistener"
    backend_address_pool_name  = "${var.vnet-sub}-backend-addresspool"
    backend_http_settings_name = "${var.vnet-sub}-backendsetting"
  }
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


