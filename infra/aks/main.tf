resource "azurerm_resource_group" "cprime_rg" {
  name     = var.resource_group
  location = var.resource_group_location
}


resource "azurerm_container_registry" "cprime_acr" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.cprime_rg.name
  location            = azurerm_resource_group.cprime_rg.location
  sku                 = var.container_registry_sku_name
  admin_enabled       = var.container_registry_admin_enabled # Set to true if you need the admin user enabled
}

resource "azurerm_kubernetes_cluster" "cprime_cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.cprime_rg.location
  resource_group_name = azurerm_resource_group.cprime_rg.name
  dns_prefix          = var.cluster_dns_prefix # Replace with an appropriate DNS prefix
  kubernetes_version  = "1.28.5"

  depends_on = [azurerm_resource_group.cprime_rg, azurerm_container_registry.cprime_acr]
  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size # Replace with the desired VM size
  }

  #   addon_profile {
  #     oms_agent {
  #       enabled = true
  #     }
  #   }

  identity {
    type = "SystemAssigned"
  }

  #   ssh_key {
  #     key_data = file("~/.ssh/id_rsa.pub") # Replace with the path to your public SSH key
  #   }
}
