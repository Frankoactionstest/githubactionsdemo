# resource "azurerm_resource_group" "test" {
#   name   = var.rg_name
#   location = var.region
#   tags = {
#     environment = var.environment
#     owner       = var.owner
#   }
# }
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }

  backend "azurerm" {
    key                  = "test3.terraform.tfstate"
  }
  required_version = ">=0.12"
}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}


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