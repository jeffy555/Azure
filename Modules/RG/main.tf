resource "azurerm_resource_group" "Demo" {
  name     = var.name
  location = var.location
  tags = var.global_tags
}