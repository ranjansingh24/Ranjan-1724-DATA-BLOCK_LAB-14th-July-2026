resource "azurerm_bastion_host" "bastion" {

  for_each = var.bastiondetails

  name                = each.value.bastion_name
  location            = data.azurerm_resource_group.rgdata.location
  resource_group_name = data.azurerm_resource_group.rgdata.name

  ip_configuration {

    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.bastionsubnet.id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id

  }

}

data "azurerm_resource_group" "rgdata" {

  name = "RanjanPG"

}

data "azurerm_virtual_network" "vnetdata" {

  name                = "vnet1"
  resource_group_name = data.azurerm_resource_group.rgdata.name

}

data "azurerm_subnet" "bastionsubnet" {

  name                 = "AzureBastionSubnet"
  virtual_network_name = data.azurerm_virtual_network.vnetdata.name
  resource_group_name  = data.azurerm_resource_group.rgdata.name

}

resource "azurerm_public_ip" "pip" {

  for_each = var.bastiondetails

  name                = each.value.public_ip_name
  location            = data.azurerm_resource_group.rgdata.location
  resource_group_name = data.azurerm_resource_group.rgdata.name

  allocation_method = "Static"
  sku               = "Standard"

}