# data "aws_lambda_invocation" "run_root" {
#   count         = var.run ? 1 : 0
#   function_name = aws_lambda_function.lambda.function_name
#   input         = "{}"
#   depends_on = [
#     var.efs,
#     aws_iam_role_policy_attachment.lambda_VPC,
#     aws_iam_role_policy_attachment.lambda_policy
#   ]
# }

# output "result_entry" {
#   value = var.run ? jsondecode(data.aws_lambda_invocation.run_root[0].result) : null
# }