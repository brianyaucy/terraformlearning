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

# variable "instance_names" {
#     type = list
#     default = ["One", "Two"]
# }

# # resource "aws_instance" "ec2_two" {
# #   ami                    = "${data.aws_ami.latest_aws_ami.id}"
# #   instance_type          = "t2.micro"
# #   tags = { for k, v in merge({
# #     "Name" = "EC2 by Terraform - ${count.index}"
# #     },
# #     var.default_tags
# #     ) : k => v
# #   }
# #   count = 2
# # }

# resource "aws_instance" "listec2" {
#     ami = "${data.aws_ami.latest_aws_ami.id}"
#     instance_type = "t2.micro"
#     tags = {
#         "Name" = var.instance_names[count.index]
#     }
#     count = 2
# }