resource "azurerm_network_security_group" "room" {
  for_each            = var.nsgdetails
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}