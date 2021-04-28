resource "aws_ssm_parameter" "output_bucket" {
  name       = "output_bucket"
  type       = "String"
  value      = aws_s3_bucket.output_bucket.bucket
  depends_on = [module.root]
}

resource "aws_ssm_parameter" "processing_bucket" {
  name       = "processing_bucket"
  type       = "String"
  value      = aws_s3_bucket.processing_bucket.bucket
  depends_on = [module.root]
}