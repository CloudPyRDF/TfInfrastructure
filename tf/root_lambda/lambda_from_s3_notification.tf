# resource "aws_lambda_permission" "allow_terraform_bucket" {
#   count         = var.lambda_name == "reduce_lambda" ? 1 : 0
#   statement_id  = "AllowExecutionFromS3Bucket"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.lambda.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = var.input_bucket.arn
# }

# resource "aws_s3_bucket_notification" "bucket_terraform_notification" {
#   count  = var.lambda_name == "reduce_lambda" ? 1 : 0
#   bucket = var.input_bucket.id
#   lambda_function {
#     lambda_function_arn = aws_lambda_function.lambda.arn
#     events              = ["s3:ObjectCreated:*"]
#   }

#   depends_on = [aws_lambda_permission.allow_terraform_bucket]
# }
