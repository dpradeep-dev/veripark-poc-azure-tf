resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  location            = var.location
  resource_group_name = var.rg_name
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 1
  }
  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.subnet_id
  }
  frontend_port {
    name = "http"
    port = 80
  }
  frontend_ip_configuration {
    name = "frontend-ip"
    public_ip_address_id = var.public_ip_id
  }
  backend_address_pool {
    name = "backend-pool"
    fqdns = var.fqdns_names
  }
  backend_http_settings {
    name = "backend-http"
    port = 80
    protocol = "Http"
    cookie_based_affinity = "Disabled"
  }
  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = "routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-http"
    priority = 100
  }
}
