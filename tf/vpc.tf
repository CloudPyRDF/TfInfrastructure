
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "efs_root" {
  vpc_id = aws_vpc.main.id
  # availability_zone = "us-west-2a"
  cidr_block = "10.0.1.0/24"
}

# resource "aws_default_subnet" "default_az1" {
#   availability_zone = var.region

#   tags = {
#     Name = "Default subnet for us-east-1a"
#   }
# }

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}