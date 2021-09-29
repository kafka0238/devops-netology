provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  web_instance_type_map = {
    stage = "t3.micro"
    prod = "t3.large"
  }
}

locals {
  web_instance_count_map = {
    stage = 0
    prod = 1
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.web_instance_type_map[terraform.workspace]
  count = local.web_instance_count_map[terraform.workspace]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Netology"
  }
}

locals {
  instances = {
    "stage" = {
    }
    "prod" = {
      "t3.micro" = data.aws_ami.ubuntu.id
      "t3.micro" = data.aws_ami.ubuntu.id
    }
  }
}

resource "aws_instance" "web2" {
  for_each = local.instances[terraform.workspace]

  ami = each.value
  instance_type = each.key

  tags = {
    Name = "Netology"
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}