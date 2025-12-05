variable "subscription_name" {
  description = "Azure Subscription 1"
  type        = string
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
  default     = "eastus2"
}
variable "vm_zone" {
  description = "Availability zone for the virtual machine"
  type        = string
  default     = "1"
}
variable "vm_image" {
  description = "The image to use for the virtual machine"
  type        = string
  default     = "MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest"
}   
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
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