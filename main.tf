provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "myaks" {
  name     = var.rgname
  location = var.location
}

module "ServicePrincipal" {
  source = "./modules/ServicePrincipal"
  service_principal_name = var.service_principal_name

  depends_on = [ azurerm_resource_group.myaks ]
  
}