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
# Azurerm Static Web Page Custom DNS CNAME
#
resource "azurerm_dns_cname_record" "cname" {

  name = "www"
  zone_name = "slonesecurity.com"
  resource_group_name = module.static-web-app.resource_group_name
  ttl = 300
  record = azurerm_static_site.staticapp.default_host_name
}

resource "azurerm_static_site_custom_domain" "name" {
  static_site_id = azurerm_static_site.staticapp.id
  domain_name = "${ azurerm_dns_cname_record.cname.name }.${azurerm_dns_cname_record.cname.zone_name}"
  validation_type = "cname-delegation"
}