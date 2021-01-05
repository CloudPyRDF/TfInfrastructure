
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}
resource "aws_internet_gateway" "primary" {
  vpc_id = aws_vpc.main.id
}
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.128.0/17"
  map_public_ip_on_launch = true
}
resource "aws_route" "primary_internet_access" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.primary.id
}
resource "aws_route_table_association" "assoc_pub" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_vpc.main.main_route_table_id
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.primary]
}

resource "aws_subnet" "efs_root" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.0.0/17"
}

resource "aws_security_group" "default" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
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
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.r.id
}
