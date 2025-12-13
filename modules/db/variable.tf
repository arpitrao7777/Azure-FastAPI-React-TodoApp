variable "db_names" {
  type = map(object({
    name                = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    server_name         = string
    resource_group_name = string
  }))
}
