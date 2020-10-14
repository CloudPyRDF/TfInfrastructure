variable "pkg_filename" {}
variable "lambda_name" {}
# variable "lambda_role" {}
variable "handler" {}
variable "memory_size" {}
variable "timeout" {}
variable "config" {
  type = map
}

variable "tags" {
  type = map
}

variable "input_bucket" {}
variable "eos_login" {}
variable "eos_password" {}
