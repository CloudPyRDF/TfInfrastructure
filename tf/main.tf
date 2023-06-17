module "root" {
  source         = "./root_lambda"
  lambda_name    = var.root_lambda_name
  memory_size    = var.root_lambda_memory_size
  timeout        = var.root_lambda_timeout
  root_image_uri = var.root_image_uri
  processing_bucket  = aws_s3_bucket.processing_bucket
}
