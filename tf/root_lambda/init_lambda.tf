data "aws_lambda_invocation" "run_root" {
  count         = var.run ? 1 : 0
  function_name = aws_lambda_function.lambda.function_name
  input         = <<JSON
{
  "bucket_name": "${var.input_bucket}"
}
JSON
}

output "result_entry" {
  value = var.run ? jsondecode(data.aws_lambda_invocation.run_root[0].result) : null
}