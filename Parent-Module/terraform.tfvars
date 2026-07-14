rgdeatils = {
  RG1 = {
    name     = "RanjanPG"
    location = "Japan East"
    tags = {
      enviroment = "dev"
      managed_by = "terraform"
    }
  }
}

vnetdetails = {
  vnet1 = {
    name                = "vnet1"
    location            = "Japan East"
    resource_group_name = "RanjanPG"
    address_space       = ["10.18.0.0/16"]
  }
}
sunbnetdetails = {
  sunbet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "RanjanPG"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.18.1.0/24"]
  }

  sunbet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "RanjanPG"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.18.2.0/24"]
  }

  sunbet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "RanjanPG"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.18.3.0/24"]
  }
}
nicdetails = {

  nicfrontend = {
    name                = "nicfrontend"
    location            = "Japan East"
    resource_group_name = "RanjanPG"

    ip_configuration = {
      name                          = "testconfiguration1"
      private_ip_address_allocation = "Dynamic"
    }
  }

  nicbackend = {
    name                = "nicbackend"
    location            = "Japan East"
    resource_group_name = "RanjanPG"

    ip_configuration = {
      name                          = "testconfiguration1"
      private_ip_address_allocation = "Dynamic"
    }
  }
}
publicipdetails = {

  pipfrontend = {

    name              = "pipfrontend"
    allocation_method = "Static"
    sku               = "Standard"

  }

  pipbackend = {

    name              = "pipbackend"
    allocation_method = "Static"
    sku               = "Standard"

  }
}
nsgdetails = {
  nsg = {
    name                = "acceptanceTestSecurityGroup1"
    location            = "JapanEast"
    resource_group_name = "RanjanPG"
  }
}
bastiondetails = {

  bastion01 = {

    bastion_name          = "Ranjanbastion"
    public_ip_name        = "bastion-pip-01"
    ip_configuration_name = "configuration"

  }

}
vmdetails = {

  vmfrontend = {

    vm_name        = "Ranjannetflixvm"
    vm_size        = "Standard_D4s_v3"
    nic_name       = "nicfrontend"
    admin_username = "adminranjan"
    admin_password = "admin@123456"

  }

  vmbackend = {

    vm_name        = "Ranjanstarbugsvm"
    vm_size        = "Standard_D2s_v3"
    nic_name       = "nicbackend"
    admin_username = "adminranjan"
    admin_password = "admin@123456"

  }

}