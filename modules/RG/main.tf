resource "azurerm_resource_group" "actionstest" {
  name   = var.rg_name
  location = var.region
  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "test2"
  resource_group_name      = azurerm_resource_group.actionstest.name
  location                 = azurerm_resource_group.actionstest.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}