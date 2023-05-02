provider "aws" {
  region = var.aws_kthong_region
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}