variable "pkg_filename" {}
variable "lambda_name" {}
variable "handler" {}
variable "memory_size" {}
variable "timeout" {}
variable "lambda_sg" {}
variable "lambda_subnet" {}
variable "runtime" {}
variable "efs" {}
variable "config" {
  type = map
}

variable "tags" {
  type = map
}

variable "input_bucket" {}
