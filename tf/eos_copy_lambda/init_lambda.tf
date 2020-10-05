# data "aws_lambda_invocation" "get_sample_data" {
#   function_name = aws_lambda_function.lambda.function_name

#   input = <<JSON
# {
#   "path": "user/j/jkusnier/DQM/",
#   "resource": "new.root",
#   "login": "${var.eos_login}",
#   "password": "${var.eos_password}",
#   "bucket_name": "${aws_s3_bucket.input_bucket.bucket}",
#   "object_key": "test.root"
# }
# JSON
# }

# output "result_entry" {
#   value = jsondecode(data.aws_lambda_invocation.get_sample_data.result)
# }