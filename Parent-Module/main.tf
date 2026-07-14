module "resource_azurerm_resource_group" {
  source    = "../Child_Moudle/Azurerm_Resource_Group"
  rgdeatils = var.rgdeatils
}
module "Vnet" {
  source      = "../Child_Moudle/Azurerm_Virtual_Network"
  depends_on  = [module.resource_azurerm_resource_group]
  vnetdetails = var.vnetdetails
}
module "sunbet" {
  source         = "../Child_Moudle/Azurerm_Subnet"
  depends_on     = [module.Vnet]
  sunbnetdetails = var.sunbnetdetails
}
module "NIC" {
  source     = "../Child_Moudle/azurerm_network_interface"
  depends_on = [module.sunbet, module.PIP]
  nicdetails = var.nicdetails
}
module "PIP" {
  source          = "../Child_Moudle/azurerm_Publicip"
  depends_on      = [module.sunbet]
  publicipdetails = var.publicipdetails
}
module "nsg" {
  source     = "../Child_Moudle/azurerm_network_security_group"
  depends_on = [module.NIC]
  nsgdetails = var.nsgdetails
}
module "namebastion" {
  source         = "../Child_Moudle/azurerm_Bastions"
  depends_on     = [module.sunbet, module.PIP]
  bastiondetails = var.bastiondetails

}
module "vm" {
  source     = "../Child_Moudle/azurerm_virtual_machine"
  depends_on = [module.NIC]
  vmdetails  = var.vmdetails
}