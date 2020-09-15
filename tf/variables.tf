variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "lambda_name" {
  default = "basic_lambda"
}

variable "lambda_memory_size" {
  default = 128
}

variable "lambda_timeout" {
  default = 120
}

variable "lambda_pkg_filename" {
  default = "pkg/lambda.zip"
}

variable "lambda_handler" {
  default = "handler.lambda_handler"
}

variable "tags" {
  type    = map
  default = {}
}
