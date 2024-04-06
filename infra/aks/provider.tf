terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.98.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "tfstate"
    storage_account_name  = "tfstatecprime"
    container_name        = "cprimestate"
    key                   = "cprime.terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  client_id       = var.arm_client_id
  client_secret   = var.arm_client_secret
  subscription_id = var.arm_subscription_id
  tenant_id       = var.arm_tenant_id
}
