provider "aws" {
  region = local.aws_kthong_region
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}