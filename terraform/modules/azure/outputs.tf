# Output the public IP of the VM
output "public_ip" {
  value       = data.azurerm_public_ip.public_ip.ip_address
  description = "Public IP address of the VM"
}
