
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "efs_root" {
  vpc_id = aws_vpc.main.id
  # availability_zone = "us-west-2a"
  cidr_block = "10.0.1.0/24"
}

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

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.efs_root.id
  route_table_id = aws_route_table.r.id
}


resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3"
}

resource "aws_vpc_endpoint_route_table_association" "route_table_association" {
  route_table_id  = aws_route_table.r.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}
