resource "aws_s3_bucket" "input_bucket" {
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "ROOT Input Bucket"
    Environment = "Dev"
  }
}