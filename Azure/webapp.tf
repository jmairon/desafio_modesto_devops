resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "asp${lower(var.name)}"
  location            = azurerm_resource_group.mtec.location
  resource_group_name = azurerm_resource_group.mtec.name
  kind                = "linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "P1v2"
  }
}

resource "azurerm_app_service" "rg-webapp" {
  name                = var.name
  location            = azurerm_resource_group.mtec.location
  resource_group_name = azurerm_resource_group.mtec.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
    site_config {
                    dotnet_framework_version = "v6.0"
                    always_on                = "true"
                    ftps_state               = "Disabled"
                    linux_fx_version = "DOCKER|jmairon/desafio_devops:1.2"


                  }
    app_settings = {
                DOCKER_REGISTRY_SERVER_PASSWORD = ""
                DOCKER_REGISTRY_SERVER_URL = "https://index.docker.io"
                DOCKER_REGISTRY_SERVER_USERNAME =  ""
                WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
            }
 }            
