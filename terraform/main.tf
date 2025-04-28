terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

# Local variables
locals {
  cluster_name = "ecommerce-cluster"
  region      = "us-east-1"
  tags = {
    Environment = "production"
    Project     = "ecommerce"
    Terraform   = "true"
  }
} 
