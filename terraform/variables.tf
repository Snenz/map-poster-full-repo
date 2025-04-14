# This file contains the variable definitions for the whole Terraform project.

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

# MongoDB Atlas API access
variable "mongodb_atlas_public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
  sensitive   = true
}
variable "mongodb_atlas_private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
  sensitive   = true
}

# MongoDB project
variable "mongodb_atlas_project_id" {
  description = "MongoDB Atlas Project ID"
  type        = string
  sensitive   = true
}

# MongoDB cluster
variable "mongodb_atlas_cluster" {
  description = "Name of the MongoDB Cluster"
  type        = string
}
variable "mongodb_atlas_region" {
  description = "Region for MongoDB Cluster"
  type        = string
  default     = "EU_CENTRAL_1"
}

# MongoDB collection
variable "mongodb_atlas_collection_name" {
  description = "Name of the MongoDB collection"
  type        = string
}

# MongoDB database and user
variable "mongodb_atlas_db_name" {
  description = "Name of the MongoDB database"
  type        = string
}
variable "mongodb_atlas_db_username" {
  description = "Username for the MongoDB user"
  type        = string
  sensitive   = true
}
variable "mongodb_atlas_db_password" {
  description = "Password for the MongoDB user"
  type        = string
  sensitive   = true
}
