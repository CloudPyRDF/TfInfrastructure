# data "aws_lambda_invocation" "run_root" {
#   function_name = aws_lambda_function.lambda.function_name
#   input = <<JSON
# {
#   "bucket_name": "${var.input_bucket}"
# }
# JSON
# }

# output "result_entry" {
#   value = jsondecode(data.aws_lambda_invocation.run_root.result)
# }