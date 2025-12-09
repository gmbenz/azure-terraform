variable "subscription_id" {
  description = "ID of the Azure subscription"
  type        = string
  default = "0705d8dc-373b-44a1-a242-bc0e1364c253"
  }
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-terraform-demo"
}
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vm-demo"
}
variable "vm_region" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "westus"
}
# Not supported in westus
#variable "vm_zone" {
#  description = "Availability zone for the virtual machine"
#  type        = string
#  default     = "1"
#}
variable "vm_image" {
  description = "The image to use for the virtual machine"
  type        = string
  default     = "MicrosoftWindowsServer:WindowsServer:2022-Datacenter:latest"
}   
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_E2s_v3"
}
variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}
variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  default     = "P@ssword1234!"
}