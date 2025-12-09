output "vm_private_ip" {
  description = "Private IP address assigned to the VM"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "nic_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.nic.id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "bastion_public_ip" {
  description = "Public IP address of Azure Bastion"
  value       = azurerm_public_ip.bastion_pip.ip_address
}

output "bastion_dns_name" {
  description = "DNS name of Azure Bastion"
  value       = azurerm_bastion_host.bastion.dns_name
}
