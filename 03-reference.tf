terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2-easy" {
  ami                    = "${data.aws_ami.latest_aws_ami.id}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.easyec2_sg.id]
  tags = { for k, v in merge({
    "Name" = "EC2 by Terraform"
    },
    var.default_tags
    ) : k => v
  }
}

resource "aws_eip" "ec2_ip" {
  vpc = true
  tags = { for k, v in merge({
    "Name" = "EIP for EC2 Easy"
    },
    var.default_tags
    ) : k => v
  }
}

resource "aws_eip_association" "ec2-easy-eip-assoc" {
  instance_id   = aws_instance.ec2-easy.id
  allocation_id = aws_eip.ec2_ip.id
}

resource "aws_security_group" "easyec2_sg" {
  name        = "Easy EC2 Security Group"
  description = "Allow traffic from Brain You"

  ingress {
    description = "Allow Brain You Home Access to SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.brainyou_ip}"]
  }

  ingress {
    description = "Allow Brain You Home Access to HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.brainyou_ip}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { for k, v in merge({
    "Name" = "Security Group for EC2 Easy"
    },
    var.default_tags
    ) : k => v
  }
}