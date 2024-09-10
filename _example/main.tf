provider "azurerm" {
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
