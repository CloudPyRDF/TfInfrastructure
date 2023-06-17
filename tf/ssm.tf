resource "aws_ssm_parameter" "processing_bucket" {
  name       = "processing_bucket"
  type       = "String"
  value      = aws_s3_bucket.processing_bucket.bucket
  depends_on = [module.root]
}