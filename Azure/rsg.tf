data "azurerm_client_config" "main" {}

resource "azurerm_resource_group" "mtec" {
  name     = "${var.tipo}-${var.Company}-${var.name}-${var.Environment}"
  location = var.location
  tags = {
    Environment = var.Environment
    Company     = var.Company
    Department  = var.Department
    Project     = var.Project
  }
}
