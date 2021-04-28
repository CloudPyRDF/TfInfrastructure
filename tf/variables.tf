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
  default = 128
}

variable "eos_lambda_timeout" {
  default = 600
}

variable "eos_default_path" {
  type    = string
  default = "user/j/jkusnier/AWS_ROOT/"
}

variable "eos_login" {
  type    = string
  default = "a"
}

variable "eos_password" {
  type    = string
  default = "b"
}

variable "run_eos" {
  default = true
}

####################################
### VARS FOR LAMBDA RUNNING ROOT ###
####################################

variable "root_lambda_name" {
  default = "root_lambda"
}

## Create terraform.tfvars file with:
# root_image_uri = "${url_to_private_ecr_repo}"
## to run this
variable "root_image_uri" {

}

variable "root_lambda_memory_size" {
  # per https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html
  default = 1769
}

variable "root_lambda_timeout" {
  default = 900
}
