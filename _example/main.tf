provider "azurerm" {
  subscription_id = "e732de0d-fe16-4e8e-b86d-758327e0145c"
  features {}
}

module "resource_group" {
  source      = "git::https://github.com/SyncArcs/terraform-azure-resource-group.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  location    = "North Europe"
}


module "vnet" {
  source              = "./../"
  name                = "vnet"
  environment         = "dev"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}
