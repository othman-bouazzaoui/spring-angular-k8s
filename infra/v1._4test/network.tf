resource "azurerm_virtual_network" "vnet" {

  name                = "vnet-angular-dev"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = [
    "10.0.0.0/16"
  ]

}

resource "azurerm_subnet" "aks" {

  name = "aks"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [
    "10.0.1.0/24"
  ]

}

resource "azurerm_public_ip" "ingress" {

  name                = "aks-ingress-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
  allocation_method = "Static"
  sku               = "Standard"
  domain_name_label = "angular-dev-othman"
  
}