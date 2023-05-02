provider "aws" {
  region = local.aws_region
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

locals {
  aws_region = var.aws_kthong_region
}