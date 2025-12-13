variable "kv_rg_names" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "kv_names" {
  type  = map(object({
    name                   = string
    location               = string
    resource_group_name    = string
  }))
}