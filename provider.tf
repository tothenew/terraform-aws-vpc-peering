terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
    alias   = "default"
    region = "ap-south-1"
    profile = "ankit"
}

provider "aws" {
    alias   = "vpc2"
    region  = "us-east-2"
    profile = "ankit"
}