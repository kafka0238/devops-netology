terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kafka0238"

    workspaces {
      name = "app-terraform"
    }
  }

  required_version = ">= 0.13.0"
}
