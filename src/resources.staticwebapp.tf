#
# Azurerm Static Web Page
#

resource "azurerm_static_site" "staticapp" {
  name = "static-web-app"
  resource_group_name = module.static-web-app.resource_group_name
  location = var.location
  sku_tier = "Standard"
  sku_size = "Standard"
}

#
# Azurerm Static Web Page Custom DNS Zone
#

resource "azurerm_dns_zone" "dnszone" {
  name = "www.slonesecurity.com" # Root domain
  resource_group_name = module.static-web-app.resource_group_name
}

#
# Azurerm Static Web Page Custom DNS CNAME
#
resource "azurerm_dns_cname_record" "name" {
  name = "test"
  zone_name = azurerm_dns_zone.dnszone.name
  resource_group_name = module.static-web-app.resource_group_name
  ttl = 300
  record = "brave-wave-0f630260f.3.azurestaticapps.net"
}