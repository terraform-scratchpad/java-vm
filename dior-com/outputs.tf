#
# MySQL outputs
#


#
# VM Outputs
#
output "vm-public-ip" {
  value = "${module.vm.vm-public-ip}"
}

output "vm-admin-username" {
  value = "${module.vm.vm-admin-username}"
}

output "vm-admin-password" {
  value = "${module.vm.vm-admin-password}"
}