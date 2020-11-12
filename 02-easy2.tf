# # terraform {
# #   required_providers {
# #     aws = {
# #       source  = "hashicorp/aws"
# #       version = "~> 3.0"
# #     }
# #   }
# # }

# provider "aws" {
#     region = "ap-southeast-1"
# }

# resource "aws_eip" "demo2_lb" {
#     vpc = true
# }

# # output "demo2_eip" {
# #     value = aws_eip.demo2_lb.public_ip
# # }

# resource "aws_s3_bucket" "demo2_s3" {
#     bucket = "brainyou-demo2-s3"
# }

# # output "demo2_s3" {
# #     value = aws_s3_bucket.demo2_s3.bucket_domain_name
# # }
