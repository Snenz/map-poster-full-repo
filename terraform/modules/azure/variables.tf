# This file contains the variable definitions for the Azure module.

# Azure provider configuration
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}
variable "client_id" {
  description = "Azure client ID"
  type        = string
  sensitive   = true
}
variable "client_secret" {
  description = "Azure client secret"
  type        = string
  sensitive   = true
}
variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
}

# Resource naming configuration
variable "ressource_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "MapPoster"
}

# Azure region configuration
variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "westeurope"
}

# VM access configuration
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  sensitive   = true
}
variable "ssh_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}
