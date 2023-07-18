provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-06ca3ca175f37dd66" 
  instance_type =  "t2.micro"
  key_name = "cloud-lab-nv"
  security_groups = ["demo-sg"]
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH access"
  

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "ssh"
    cidr_blocks      = ["67.162.72.19/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}