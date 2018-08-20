variable "location" {}
variable "resource_group_name" {}
variable "db-name" {
  default = "diordb"
}

variable "custom-image-name" {
  default = "debian-full-ecom"
}

variable "vm_flavor" {
  #E8s_v3
  default = "Standard_D8s_v3"
}

variable "tags" {
  type = "map"
  default = {
    scope         = "qa"
    source        = "terraform"
    env           = "staging"
    costEntity    = "dior"
    flavor        = "java"
  }
}