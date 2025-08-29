resource "aws_vpc" "main" {
  cidr_block                = var.vpc_cidr
  tags                      = var.tags
}

resource "aws_subnet" "public" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.public_subnet_cidr
  map_public_ip_on_launch   = true
  availability_zone         = var.az
  tags                      = var.tags
}

resource "aws_security_group" "ecs_sg" {
  name                      = "ecs-sg"
  vpc_id                    = aws_vpc.main.id
  tags                      = var.tags

  ingress {
    from_port               = 80
    to_port                 = 80
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }

  ingress {
    from_port               = 8080
    to_port                 = 8080
    protocol                = "tcp"
    cidr_blocks             = ["0.0.0.0/0"]
  }

  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }
}