resource "null_resource" "prepare_lambda_sources" {
  provisioner "local-exec" {
    command = "./build.sh"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf pkg"
  }
}


module "eos" {
  source           = "./eos_copy_lambda"
  lambda_name      = var.eos_lambda_name
  memory_size      = var.eos_lambda_memory_size
  timeout          = var.eos_lambda_timeout
  eos_login        = var.eos_login
  eos_password     = var.eos_password
  eos_default_path = var.eos_default_path
  input_bucket     = aws_s3_bucket.input_bucket
  depends_on       = [null_resource.prepare_lambda_sources]
}

module "root" {
  source       = "./root_lambda"
  lambda_name  = var.root_lambda_name
  memory_size  = var.root_lambda_memory_size
  timeout      = var.root_lambda_timeout
  image_uri    = var.root_image_uri
  input_bucket = aws_s3_bucket.processing_bucket

  depends_on = [
    module.eos
  ]
}

# module "reduce_lambda" {
#   source      = "./root_lambda"
#   lambda_name = var.reduce_lambda_name
#   input_bucket  = aws_s3_bucket.processing_bucket
#   depends_on = [module.init_root_lambda]
# }