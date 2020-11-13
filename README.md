# terraformlearning

```
terraform destroy --target aws_instance.EC2-Easy
```

## Variables

* Can assign via terraform.tfvars (must match this name exactly)

```
intancetype="t2.large"
```

* Or variables.tf (less priortized)

```
variable "instancetype" {
    default = "t2.large"
}
```

* A less preferred way is to do it in the command line ...

```
terraform apply -var="instancetype=t2.large"
terraform apply -var-file="xxx.tfvars"
```

* Alternatively ... use environment variable 

```
export TF_VAR_instancetype="t2.large"
```

## Multiple instances within a resource

```
resource "aws_instance" "ec2_two" {
  ami                    = "${data.aws_ami.latest_aws_ami.id}"
  instance_type          = "t2.micro"
  tags = { for k, v in merge({
    "Name" = "EC2 by Terraform - ${count.index}"
    },
    var.default_tags
    ) : k => v
  }
  count = 2
}
```
