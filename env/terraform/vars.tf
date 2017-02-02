variable "tenant_name" {
  type = "string"
  description = "targeted tenant for openstack api"
}

variable "auth_url" {
  type = "string"
  description = "authentication endpoint of openstack api"
}

variable "user_name" {
  type = "string"
  description = "username credential for openstack api"
}

variable "password" {
  type = "string"
  description = "password credential for openstack api"
}

variable "instance-count" {
  type    = "string"
  description = "how many instance you want to create"
}
