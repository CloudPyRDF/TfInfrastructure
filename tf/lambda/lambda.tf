resource "aws_lambda_function" "lambda" {
  filename         = "${data.local_file.pkg_file.filename}"
  function_name    = "${var.name}"
  role             = "${var.role_arn}"
  source_code_hash = "${base64sha256(data.local_file.pkg_file.content)}"
  handler          = "${var.handler}"
  runtime          = "python3.7"
  memory_size      = "${var.memory_size}"
  timeout          = "${var.timeout}"
  
  environment {
    variables = "${var.config}"
  }

  tags = "${var.tags}"
}
