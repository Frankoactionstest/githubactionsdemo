# resource "azurerm_resource_group" "test" {
#   name   = var.rg_name
#   location = var.region
#   tags = {
#     environment = var.environment
#     owner       = var.owner
#   }
# }

resource "azurerm_storage_account" "example" {
  name                     = "test2torromenia"
  resource_group_name      = var.rg_name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
    owner       = var.owner
  }
}