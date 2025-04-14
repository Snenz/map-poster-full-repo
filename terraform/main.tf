terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }

  required_version = "~> 1.11"
}

module "azure" {
  source = "./modules/azure"

  # Azure provider configuration
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  # Resource naming configuration
  ressource_prefix = var.ressource_prefix

  # Azure region configuration
  location = var.location

  # VM access configuration
  admin_username = var.admin_username
  ssh_key_path   = var.ssh_key_path
}

# Create a local file with the inventory for Ansible
resource "local_sensitive_file" "output_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = <<EOT
[virtual-machines]
vm01 ansible_host=${module.azure.public_ip} ansible_user=${var.admin_username}
EOT
}

module "mongodb" {
  source = "./modules/mongodb"

  # MongoDB Atlas API access
  mongodb_atlas_public_key  = var.mongodb_atlas_public_key
  mongodb_atlas_private_key = var.mongodb_atlas_private_key

  # MongoDB project
  mongodb_atlas_project_id = var.mongodb_atlas_project_id

  # MongoDB cluster
  mongodb_atlas_cluster = var.mongodb_atlas_cluster
  mongodb_atlas_region  = var.mongodb_atlas_region

  # MongoDB collection
  mongodb_atlas_collection_name = var.mongodb_atlas_collection_name

  # MongoDB database and user
  mongodb_atlas_db_name     = var.mongodb_atlas_db_name
  mongodb_atlas_db_username = var.mongodb_atlas_db_username
  mongodb_atlas_db_password = var.mongodb_atlas_db_password

  # Azure VM IP address
  web_app_ip_address = module.azure.public_ip
}

# Create a local file with the MongoDB connection string for Ansible
resource "local_sensitive_file" "output_container_env" {
  filename = "${path.module}/../ansible/.env.production"
  content  = <<EOT
MONGODB_ATLAS_URI=${module.mongodb.mongodb_atlas_full_connection_string}
MONDODB_ATLAS_DB_NAME=${var.mongodb_atlas_db_name}
EOT
}
