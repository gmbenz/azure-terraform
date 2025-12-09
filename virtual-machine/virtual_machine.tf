locals {
  vm_image_parts = split(":", var.vm_image)
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = local.vm_image_parts[0]
    offer     = local.vm_image_parts[1]
    sku       = local.vm_image_parts[2]
    version   = local.vm_image_parts[3]
  }

  #zone = var.vm_zone
}
