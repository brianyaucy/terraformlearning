# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

# provider "aws" {
#   region = "ap-southeast-1"
# }

# resource "aws_instance" "EC2-Easy" {
#   ami           = "ami-015a6758451df3cb9"
#   instance_type = "t2.micro"
#   tags = {
#     Name      = "EC2 by Terraform"
#     CreatedBy = "Terraform"
#     Project   = "Terraform Project"
#     Owner     = "Brain You"
#   }
# }