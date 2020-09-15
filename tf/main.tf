module "basic_lambda" {
  source        = "./lambda"
  pkg_filename = "${var.lambda_pkg_filename}"
  name          = "${var.lambda_name}"
  handler       = "${var.lambda_handler}"
  role_arn      = "${aws_iam_role.lambda_role.arn}"
  memory_size   = "${var.lambda_memory_size}"
  timeout       = "${var.lambda_timeout}"
  config = {
    "DEBUG" = "false"
  }
  tags = "${var.tags}"
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
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_policy.arn}"
}