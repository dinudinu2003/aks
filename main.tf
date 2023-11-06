provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "myaks" {
  name     = var.rgname
  location = var.location
}