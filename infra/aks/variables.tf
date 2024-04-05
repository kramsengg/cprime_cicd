variable "resource_group" {
  default = "cprime-rg"
}
variable "resource_group_location" {
  default = "eastus"
}

variable "container_registry_name" {
  default = "cprimecontainerregistry"
}

variable "container_registry_sku_name" {
  default = "Basic"
}

variable "container_registry_admin_enabled" {
  type    = bool
  default = true
}

variable "cluster_name" {
  default = "cprime-cluster"
}

variable "cluster_dns_prefix" {
  default = "cprime-cluster-dns"
}

variable "node_pool_name" {
  default = "default"
}
variable "node_count" {
  default = 2
}
variable "vm_size" {
  default = "Standard_DS2_v2"
}