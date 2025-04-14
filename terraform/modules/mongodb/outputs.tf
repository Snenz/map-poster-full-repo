# Output the MongoDB Atlas connection string
output "mongodb_atlas_full_connection_string" {
  value = format(
    "mongodb+srv://%s:%s@%s/%s",
    mongodbatlas_database_user.db_user.username,
    mongodbatlas_database_user.db_user.password,
    replace(mongodbatlas_cluster.cluster.connection_strings[0].standard_srv, "mongodb+srv://", ""),
    "?retryWrites=true&retryReads=true&w=majority&tls=true"
  )
  sensitive   = true
  description = "MongoDB Atlas full connection string"
}

