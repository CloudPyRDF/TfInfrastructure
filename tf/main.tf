resource "null_resource" "prepare_lambda_sources" {
  provisioner "local-exec" {
    command = "./build.sh"
  }
}


module "eos_lambda" {
  source       = "./eos_copy_lambda"
  pkg_filename = var.eos_lambda_pkg_filename
  lambda_name  = var.eos_lambda_name
  handler      = var.eos_lambda_handler
  memory_size  = var.eos_lambda_memory_size
  timeout      = var.eos_lambda_timeout
  config       = var.eos_lambda_config
  tags         = var.eos_lambda_tags

  input_bucket = aws_s3_bucket.input_bucket.bucket

  eos_login        = var.eos_login
  eos_password     = var.eos_password
  eos_default_path = var.eos_default_path

  run = var.run_eos
  # run=false
  
  depends_on = [null_resource.prepare_lambda_sources]
}

module "init_root_lambda" {
  source       = "./root_lambda"
  runtime      = "python3.8"
  pkg_filename = var.init_lambda_pkg_filename
  lambda_name  = var.init_lambda_name
  handler      = var.init_lambda_handler
  memory_size  = var.init_lambda_memory_size
  timeout      = var.init_lambda_timeout
  tags         = var.init_lambda_tags
  config       = var.init_lambda_config

  lambda_subnet = aws_subnet.efs_root.id
  lambda_sg     = aws_default_security_group.default.id
  input_bucket  = aws_s3_bucket.input_bucket.bucket
  efs           = aws_efs_access_point.access_point_for_lambda

  run = var.run_init_root
  # run = false

  depends_on = [module.eos_lambda]
}

module "root_lambda" {
  source       = "./root_lambda"
  runtime      = "python3.8"
  pkg_filename = var.root_lambda_pkg_filename
  lambda_name  = var.root_lambda_name
  handler      = var.root_lambda_handler
  memory_size  = var.root_lambda_memory_size
  timeout      = var.root_lambda_timeout
  tags         = var.root_lambda_tags
  config       = var.root_lambda_config

  lambda_subnet = aws_subnet.efs_root.id
  lambda_sg     = aws_default_security_group.default.id
  input_bucket  = aws_s3_bucket.input_bucket.bucket
  efs           = aws_efs_access_point.access_point_for_lambda

  # run = var.run_init_root
  run = false

  depends_on = [module.init_root_lambda]
}