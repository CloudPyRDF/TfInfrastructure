resource "aws_s3_bucket" "input_bucket" {
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "ROOT Input Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "processing_bucket" {
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "ROOT Processing Bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "output_bucket" {
  acl           = "private"
  force_destroy = true

  tags = {
    Name        = "ROOT Output Bucket"
    Environment = "Dev"
  }
}
