provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.role_arn
  }
}

terraform {
  required_version = ">= 1.13"
  required_providers {
    aws = {
      source  = "aws"
      version = "~>6.10.0"
    }
  }
}