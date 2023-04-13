#
# Azurerm Static Web Page
#

resource "azurerm_static_site" "staticapp" {
  name = "static-web-app"
  resource_group_name = module.static-web-app.resource_group_name
  location = var.location
  sku_tier = "Standard"
}