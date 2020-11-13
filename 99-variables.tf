variable brainyou_ip {
  type        = string
  default     = "8.8.8.8/32"
  description = "Brain's home IP address"
}

data "aws_ami" "latest_aws_ami" {
    most_recent = true
    owners = ["137112412989"]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

variable "default_tags" {
  description = "Default tags for the project"
  type        = map
  default = {
    CreatedBy = "Terraform"
    Project   = "Terraform Project"
    Owner     = "Brain You"
  }
}

# variable "usernumber" {
#  type = number
# }