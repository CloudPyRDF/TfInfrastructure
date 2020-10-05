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
    variables =  {
    DEBUG = "false"
  }
  }

  tags = var.tags

  file_system_config {
    arn = aws_efs_access_point.access_point_for_lambda.arn
    local_mount_path = "/mnt/lambda"
  }

  vpc_config {
    subnet_ids         = [var.lambda_subnet]
    security_group_ids = [var.lambda_sg]
  }

  # Explicitly declare dependency on EFS mount target.
  # When creating or updating Lambda functions, mount target must be in 'available' lifecycle state.
  depends_on = [aws_efs_mount_target.root_efs_mount]
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
        "ec2:DescribeNetworkInterfaces",
        "ec2:CreateNetworkInterface",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeInstances",
        "ec2:AttachNetworkInterface",
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