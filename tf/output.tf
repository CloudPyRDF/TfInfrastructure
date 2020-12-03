output "input_bucket_arn" {
  value = aws_s3_bucket.input_bucket.arn
}

output "output_bucket_arn" {
  value = aws_s3_bucket.output_bucket.arn
}

output "root_lambda_function_name" {
  value = module.eos_lambda.lambda_function_name
}

output "eos_lambda_function_name" {
  value = module.root_lambda.lambda_function_name
}