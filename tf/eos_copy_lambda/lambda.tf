resource "aws_lambda_function" "lambda" {
  filename         = data.local_file.pkg_file.filename
  function_name    = var.lambda_name
  role             = aws_iam_role.lambda_role.arn
  source_code_hash = base64sha256(data.local_file.pkg_file.content)
  handler          = var.handler
  runtime          = "python3.7"
  memory_size      = var.memory_size
  timeout          = var.timeout

  environment {
    variables = var.config
  }

  tags = var.tags
}


resource "aws_iam_role" "lambda_role" {
  name = "${var.lambda_name}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "${var.lambda_name}_policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:*",
        "sqs:SendMessage",
        "s3:*",
        "kms:Decrypt"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}