
provider "azurerm" {
   skip_provider_registration = true
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = "eastus"
}

# Create a storage account
resource "azurerm_storage_account" "st" {
  name                     = "udaystorageaccount357"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
 
=======
provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "example" {
  name                      = local.resource_group_name
  location                  = var.location
}

resource "azurerm_storage_account" "example" {
  name                      = local.storage_account_name
  resource_group_name       = azurerm_resource_group.example.name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "GRS"
}

resource "azurerm_servicebus_namespace" "example" {
  name                      = local.servicebus_namespace_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.example.name
  sku                       = "Standard"
}

