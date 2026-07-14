resource "azurerm_linux_virtual_machine" "vm" {

  for_each = var.vmdetails

  name                = each.value.vm_name
  location            = data.azurerm_resource_group.rgdata.location
  resource_group_name = data.azurerm_resource_group.rgdata.name
  size                = each.value.vm_size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  disable_password_authentication = false

  network_interface_ids = [

    data.azurerm_network_interface.nicdata[each.key].id

  ]

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

  }

}

data "azurerm_resource_group" "rgdata" {

  name = "RanjanPG"
}
data "azurerm_network_interface" "nicdata" {

  for_each = var.vmdetails

  name                = each.value.nic_name
  resource_group_name = data.azurerm_resource_group.rgdata.name

}