output "public_ip" {
  value = azurerm_public_ip.ingress.ip_address
}

output "traffic_manager_fqdn" {
  value = azurerm_traffic_manager_profile.tm.fqdn
}