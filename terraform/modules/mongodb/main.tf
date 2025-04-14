terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.32"
    }
  }

  required_version = "~> 1.11"
}

# MongoDB Atlas provider configuration
provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

# Crreate MongoDB Atlas Cluster
resource "mongodbatlas_cluster" "cluster" {
  project_id                  = var.mongodb_atlas_project_id
  name                        = var.mongodb_atlas_cluster
  provider_name               = "AWS"
  provider_region_name        = var.mongodb_atlas_region
  provider_instance_size_name = "M10"
  mongo_db_major_version      = "8.0"
}

# Create MongoDB Atlas Database User
resource "mongodbatlas_database_user" "db_user" {
  username           = var.mongodb_atlas_db_username
  password           = var.mongodb_atlas_db_password
  project_id         = var.mongodb_atlas_project_id
  auth_database_name = "admin"

  roles {
    role_name       = "readWrite"
    database_name   = var.mongodb_atlas_db_name
    collection_name = var.mongodb_atlas_collection_name
  }
}

# Allow access from Azure VM to MongoDB Atlas
resource "mongodbatlas_project_ip_access_list" "ip_access" {
  project_id = var.mongodb_atlas_project_id
  ip_address = var.web_app_ip_address
  comment    = "Allow access from Azure VM"
}
