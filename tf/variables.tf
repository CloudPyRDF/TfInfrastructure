variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "eos_lambda_name" {
  default = "eos-lambda"
}

variable "eos_lambda_memory_size" {
  default = 1024
}

variable "eos_lambda_timeout" {
  default = 120
}

variable "eos_lambda_pkg_filename" {
  default = "pkg/eos-lambda.zip"
}

variable "eos_lambda_handler" {
  default = "lambda.lambda_handler"
}

variable "eos_login" {
  type = string
}
variable "eos_password" {
  type = string
}
variable "eos_lambda_tags" {
  type    = map
  default = {}
}

variable "eos_lambda_config" {
  default = {
    DEBUG = "false"
  }
}

################################################
### VARS FOR LAMBDA INITIALIZING ROOT ON EFS ###
################################################

variable "init_lambda_name" {
  default = "init_lambda"
}

variable "init_lambda_memory_size" {
  default = 1024
}

variable "init_lambda_timeout" {
  default = 240
}

variable "init_lambda_pkg_filename" {
  default = "pkg/init-lambda.zip"
}

variable "init_lambda_handler" {
  default = "lambda.lambda_handler"
}

variable "init_lambda_tags" {
  type    = map
  default = {}
}

variable "init_lambda_config" {
  type = map
  default = {
    DEBUG = "false"
  }
}

####################################
### VARS FOR LAMBDA RUNNING ROOT ###
####################################

variable "root_lambda_name" {
  default = "root_lambda"
}

variable "root_lambda_memory_size" {
  default = 128
}

variable "root_lambda_timeout" {
  default = 120
}

variable "root_lambda_pkg_filename" {
  default = "pkg/root_lambda.zip"
}

variable "root_lambda_handler" {
  default = "lambda.lambda_handler"
}

variable "root_lambda_tags" {
  type    = map
  default = {}
}

variable "root_lambda_config" {
  type = map
  default = {
    DEBUG = "false"
  }
}

