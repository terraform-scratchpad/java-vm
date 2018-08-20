# --------------------------------------------------------------- #
#                                                                 #
# Creates a ready to use environment to deploy Dior.com website   #
#                                                                 #
# --------------------------------------------------------------- #

terraform {
  backend "azurerm" {
    storage_account_name  = "qatfstate"
    container_name        = "qatfstatecnt"
    key                   = "vm-dior-com.tfstate"
  }
}

provider "azurerm" {
  version = "~> 1.12"
}

provider "null" {
  version = "~> 1.0"
}

module "vm" {
  source                        = "github.com/terraform-scratchpad/azure-custom-image-compute"
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  vm_flavor                     = "${var.vm_flavor}"
  custom-image-name             = "${var.custom-image-name}"
  custom-image-resource-group   = "${var.resource_group_name}"
  subnet_id                     = "${data.azurerm_key_vault_secret.vm-subnet-id.value}"
  nsg_id                        = "${data.azurerm_key_vault_secret.nsg-id.value}"
  tags                          = {
                                    scope         = "qa"
                                    source        = "terraform"
                                    env           = "staging"
                                    costEntity    = "dior"
                                    flavor        = "java"
                                    id            = "${terraform.workspace}"
                                    isAvailable   = true
                                  }
}



