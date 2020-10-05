module "eos_lambda" {
  source       = "./eos_copy_lambda"
  pkg_filename = var.eos_lambda_pkg_filename
  lambda_name  = var.lambda_name
  handler      = var.eos_lambda_handler
  memory_size  = var.eos_lambda_memory_size
  timeout      = var.eos_lambda_timeout

  config = {
    "DEBUG" = "false"
  }
  tags         = var.eos_lambda_tags

  eos_login    = var.eos_login
  eos_password = var.eos_password
  # depends_on   = [init_root_lambda]
}

module "init_root_lambda" {
  source        = "./init_root_lambda"
  pkg_filename  = var.init_lambda_pkg_filename
  lambda_name   = var.init_lambda_name
  handler       = var.init_lambda_handler
  memory_size   = var.init_lambda_memory_size
  timeout       = var.init_lambda_timeout
  tags          = var.init_lambda_tags
  config        = var.init_lambda_config
  lambda_subnet = aws_subnet.efs_root.id
  lambda_sg     = aws_default_security_group.default.id
}