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

# resource "aws_iam_user" "newuser" {
#     name = var.usernumber
#   tags = { for k, v in merge({
#     "Name" = "EC2 user created by terraform"
#     },
#     var.default_tags
#     ) : k => v
#   }
# }