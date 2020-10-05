# data "aws_lambda_invocation" "get_sample_data" {
#   function_name = aws_lambda_function.lambda.function_name
#   input ="{}"
# }

# output "result_entry" {
#   value = jsondecode(data.aws_lambda_invocation.get_sample_data.result)
# }