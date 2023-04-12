resource "azurerm_virtual_network" "swp-vnet" {
  name = "swp-vnet"
  resource_group_name = module.static-web-app.resource_group_name
  location = var.location
  address_space = ["192.168.1.0/28"] # 192.168.1.1 -1.31
}

resource "azurerm_subnet" "swp-vnet" {
  name = "swp-snet"
  resource_group_name = module.static-web-app.resource_group_name
  virtual_network_name = azurerm_virtual_network.swp-vnet.name
  address_prefixes = ["192.168.1.0/26"] # 192.168.1.0 - 1.7
}

