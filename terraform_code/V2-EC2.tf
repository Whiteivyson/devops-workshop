
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  key_name      = "ddp"
  security_groups = ["demo_sg"]
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Allow inbound SSH traffic"

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from anywhere (Change for security)
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allows all outbound traffic
  }

  tags = {
    Name = "ssh-port"
  }
}