data "aws_lambda_invocation" "get_sample_data" {
  count         = var.run ? 1 : 0
  function_name = aws_lambda_function.lambda.function_name

  input = <<JSON
{
  "path": "${var.eos_default_path}",
  "resource": "aws_root.zip",
  "login": "${var.eos_login}",
  "password": "${var.eos_password}",
  "bucket_name": "${var.input_bucket}",
  "object_key": "aws_root.zip"
}
JSON
}

output "result_entry" {
  value = var.run ? jsondecode(data.aws_lambda_invocation.get_sample_data[0].result) : null
}