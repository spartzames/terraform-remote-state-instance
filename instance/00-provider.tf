provider "aws" {
  region = "${var.choi_region}"
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

variable "aws_kthong_region" {
  type = string
  default = "ap-southeast-2"
  description = "variable for aws region"
}