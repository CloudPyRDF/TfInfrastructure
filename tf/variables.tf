variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

###########################
### VARS FOR EOS LAMBDA ###
###########################

variable "eos_lambda_name" {
  default = "eos_lambda"
}

variable "eos_lambda_memory_size" {
  default = 224
}

variable "eos_lambda_timeout" {
  default = 120
}

variable "eos_lambda_pkg_filename" {
  default = "pkg/eos_lambda.zip"
}

variable "eos_lambda_handler" {
  default = "lambda.lambda_handler"
}

variable "eos_lambda_tags" {
  type    = map
  default = {}
}

variable "eos_lambda_config" {
  type    = map
  default = { DEBUG = "false" }
}

variable "eos_default_path" {
  type    = string
  default = "user/j/jkusnier/AWS_ROOT/"
}

variable "eos_login" { type = string }
variable "eos_password" { type = string }

variable "run_eos" {
  default = true
}


################################################
### VARS FOR LAMBDA INITIALIZING ROOT ON EFS ###
################################################

variable "init_lambda_name" {
  default = "init_lambda"
}

variable "init_lambda_memory_size" {
  default = 1536
}

variable "init_lambda_timeout" {
  default = 900
}

variable "run_init_root" {
  default = true
}

####################################
### VARS FOR LAMBDA RUNNING ROOT ###
####################################

variable "root_lambda_name" {
  default = "root_lambda"
}

variable "root_lambda_memory_size" {
  default = 512
}

variable "root_lambda_timeout" {
  default = 120
}

variable "run_test_root" {
  default = true
}

# other
variable "split_lambda_name" {
  default = "split_lambda"
}
variable "reduce_lambda_name" {
  default = "reduce_lambda"
}