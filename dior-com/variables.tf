variable "location" {}
variable "resource_group_name" {}
variable "db-name" {
  default = "diordb"
}
variable "tags" {
  type = "map"
  default = {
    scope         = "test"
    source        = "terraform"
    env           = "staging"
    costEntity    = "dior"
    flavor        = "java"
  }
}

variable "custom-image-name" {
  default = "javaImage"
}
variable "custom-image-resource-group" {
  default = "dior-staging-packer-rg"
}
