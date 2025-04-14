# Output the public IP address of the VM
output "public_ip" {
  value       = module.azure.public_ip
  description = "Public IP address of the VM"
}

# Output the MongoDB Atlas connection string
output "mongodb_atlas_full_connection_string" {
  value       = module.mongodb.mongodb_atlas_full_connection_string
  description = "MongoDB Atlas full connection string"
  sensitive   = true
}
