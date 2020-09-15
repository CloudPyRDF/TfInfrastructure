variable "pkg_filename" {}
variable "name" {}
variable "handler" {}
variable "role_arn" {}
variable "memory_size" {}
variable "timeout" {}
variable "config" {
  type = "map"
}

variable "tags" {
  type = "map"
}
