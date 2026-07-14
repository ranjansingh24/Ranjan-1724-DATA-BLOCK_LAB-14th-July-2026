resource "azurerm_network_interface" "room" {

  for_each            = var.nicdetails

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnetdata.id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}

data "azurerm_subnet" "subnetdata" {
  name                 = "frontend-subnet"
  virtual_network_name = "vnet1"
  resource_group_name  = "RanjanPG"
}
