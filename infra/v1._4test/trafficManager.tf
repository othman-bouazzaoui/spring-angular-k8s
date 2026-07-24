resource "azurerm_traffic_manager_profile" "tm" {
  name                = "tm-angular-dev"
  resource_group_name = azurerm_resource_group.rg.name

  traffic_routing_method = "Priority"

  dns_config {
    relative_name = "angular-dev-oth"
    ttl            = 30
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_external_endpoint" "aks" {
  name              = "aks-dev"
  profile_id        = azurerm_traffic_manager_profile.tm.id

  target = azurerm_public_ip.ingress.ip_address

  endpoint_location = "France Central"
}