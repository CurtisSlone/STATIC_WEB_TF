terraform {
    required_version = ">= 1.2"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.22"
    }
    azurenoopsutils = {
        source = "azurenoops/azurenoopsutils"
        version = "~> 1.0.4"
    }
  }

  backend "azurerm" {
    resource_group_name = "ampe-eastus2-network-artifacts-dev-rg"
    storage_account_name = "ampetfstatesafcd3jta2"
    container_name = "ampetfdevscfcd3jta2"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
}