variable "aws_access_key" {
  type = string
  sensitive = true
}
variable "aws_secret_key" {
  type = string
  sensitive = true
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
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
    stage   = "t3.micro"
    default = "t3.large"
  }
}

locals {
  web_instance_count_map = {
    stage   = 0
    default = 1
  }
}

module "web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "web"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = local.web_instance_type_map[terraform.workspace]
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"
  count                  = local.web_instance_count_map[terraform.workspace]

  tags = {
    Name        = "Netology"
    Terraform   = "true"
    Environment = "dev"
  }
}

locals {
  instances = {
    "stage"   = {
    }
    "default" = {
      "t3.micro" = data.aws_ami.ubuntu.id
      "t3.micro" = data.aws_ami.ubuntu.id
    }
  }
}

module "web2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = local.instances[terraform.workspace]

  name = "web2-${each.key}"

  ami                    = each.value
  instance_type          = each.key
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Name        = "Netology"
    Terraform   = "true"
    Environment = "dev"
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}