resource "aws_lambda_function" "lambda" {
  filename         = data.local_file.pkg_file.filename
  function_name    = var.lambda_name
  role             = aws_iam_role.lambda_role.arn
  source_code_hash = base64sha256(data.local_file.pkg_file.content)
  handler          = var.handler
  runtime          = var.runtime
  memory_size      = var.memory_size
  timeout          = var.timeout

  environment {
    variables = {
      bucket = "${var.input_bucket.bucket}"
    }
  }

  tags = var.tags

  file_system_config {
    arn              = var.efs.arn
    local_mount_path = "/mnt/cern_root"
  }

  vpc_config {
    subnet_ids         = [var.lambda_subnet]
    security_group_ids = [var.lambda_sg]
  }

  depends_on = [var.efs]
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
        "Action": "*",
        "Resource": "*",
        "Effect": "Allow"
    }
  ]
}
EOF
}

data "aws_iam_policy" "VPC" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "VPC_Attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = data.aws_iam_policy.VPC.arn
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
