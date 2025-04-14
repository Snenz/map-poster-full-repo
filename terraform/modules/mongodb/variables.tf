# This file contains the variable definitions for the MongoDB Atlas module.

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

# MongoDB projects
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

# Azure VM IP address
variable "web_app_ip_address" {
  description = "IP address of the web app to allow access to MongoDB Atlas"
  type        = string
}
