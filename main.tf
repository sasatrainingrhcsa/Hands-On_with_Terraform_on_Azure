terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "Modrakovic"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "9734ed68-621d-47ed-babd-269110dbacb1"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  location = "South Central US"
  name     = "813-bb94daff-hands-on-with-terraform-on-azure"
}

module "securestorage" {
  source               = "app.terraform.io/Modrakovic/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "rccaistg5363"
}
