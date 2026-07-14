resource "azurerm_public_ip" "pip" {

  for_each = var.publicipdetails

  name                = each.value.name
  location            = data.azurerm_resource_group.rgdata.location
  resource_group_name = data.azurerm_resource_group.rgdata.name

  allocation_method = each.value.allocation_method
  sku               = each.value.sku

}
data "azurerm_resource_group" "rgdata" {
  name = "RanjanPG"
}