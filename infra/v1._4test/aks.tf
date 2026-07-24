resource "azurerm_kubernetes_cluster" "aks" {

  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = "angulardev"

  kubernetes_version = null

default_node_pool {
  name                = "system"
  vm_size             = "Standard_B2s_v2"
  node_count          = 1
  os_disk_size_gb     = 30
  vnet_subnet_id      = azurerm_subnet.aks.id
  only_critical_addons_enabled = false
}

  identity {

    type = "SystemAssigned"

  }

 network_profile {
  network_plugin      = "azure"
  network_plugin_mode = "overlay"
  load_balancer_sku   = "standard"

  service_cidr   = "10.100.0.0/16"
  dns_service_ip = "10.100.0.10"
}

}