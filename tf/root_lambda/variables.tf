# variable "runtime" {
#   default = "python3.8"
# }
variable "handler" {
  default = "lambda.lambda_handler"
}
variable "memory_size" {
  default = 512
}
variable "timeout" {
  default = 120
}

# variable "tags" {
#   type    = map
#   default = {}
# }
variable "run" {
  default = false
}

variable "lambda_name" {}
variable "lambda_sg" {}
variable "lambda_subnet" {}
variable "efs" {}
variable "input_bucket" {}
