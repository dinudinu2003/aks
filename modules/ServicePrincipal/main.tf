data "azuread_client_config" "current" {}

resource "azuread_application" "myspn" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "myspn" {
  application_id = azuread_application.myspn.application_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "myspn" {
  service_principal_id = azuread_service_principal.myspn.object_id
}