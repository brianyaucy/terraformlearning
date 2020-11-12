provider "aws" {
    region = "ap-southeast-1"
}

resource "aws" "aws_instance" {
    ami = "ami-015a6758451df3cb9"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2 by Terraform"
        CreatedBy = "Terraform"
        Project = "Terraform Project"
        Owner = "Brain You"
    }
}