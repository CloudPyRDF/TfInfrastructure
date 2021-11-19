
variable "handler" {
  default = "lambda.lambda_handler"
}

variable "memory_size" {
  default = 1536
}

variable "timeout" {
  default = 900
}

variable "run" {
  default = false
}

variable "lambda_name" {
  default = "root_lambda"
}

variable "input_bucket" {}
