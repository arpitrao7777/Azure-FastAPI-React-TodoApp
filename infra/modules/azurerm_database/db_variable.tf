variable "mysql_db" {
  description = "A map of databases to create."
  type = map(object({
    server_name         = string
    resource_group_name = string
    location            = string
    admin_username      = string
    admin_password      = string
    db_name             = string
    max_size_gb         = number
  }))
}
