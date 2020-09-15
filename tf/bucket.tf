resource "aws_s3_bucket" "b" {
  acl = "private"
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}