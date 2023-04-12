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
  depends_on = [
    azurerm_static_site.staticapp
  ]
  name = "slonesecurity.com" # Root domain
  resource_group_name = module.static-web-app.resource_group_name
}

#
# AzureRM DNS TXT Record
#
# resource "azurerm_dns_txt_record" "domain-verification" {
  
#   name = "slonesecurity.com"
#   zone_name = azurerm_dns_zone.dnszone.name
#   resource_group_name = module.static-web-app.resource_group_name
#   ttl = 300

#   record {
#     value = azurerm_static_site.staticapp.default_host_name
#   }
# }

#
# Azurerm Static Web Page Custom DNS CNAME
#
resource "azurerm_dns_cname_record" "name" {
  depends_on = [
    azurerm_dns_zone.dnszone
  ]
  name = "www"
  zone_name = azurerm_dns_zone.dnszone.name
  resource_group_name = module.static-web-app.resource_group_name
  ttl = 300
  record = azurerm_static_site.staticapp.api_key
}