# data "aws_lambda_invocation" "get_sample_data" {
#   function_name = aws_lambda_function.lambda.function_name

#   input = <<JSON
# {
#   "path": "user/j/jkusnier/AWS_ROOT/",
#   "resource": "aws_root.zip",
#   "login": "${var.eos_login}",
#   "password": "${var.eos_password}",
#   "bucket_name": "${var.input_bucket}",
#   "object_key": "aws_root.zip"
# }
# JSON
# }

# output "result_entry" {
#   value = jsondecode(data.aws_lambda_invocation.get_sample_data.result)
# }