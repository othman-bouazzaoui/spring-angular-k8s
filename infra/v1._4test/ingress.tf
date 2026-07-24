resource "helm_release" "nginx" {

  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"

  chart = "ingress-nginx"

  namespace = "ingress-nginx"

  create_namespace = true
  timeout = 900
  wait    = true
  
  set {

    name = "controller.service.loadBalancerIP"

    value = azurerm_public_ip.ingress.ip_address

  }
  depends_on = [azurerm_kubernetes_cluster.aks]

}