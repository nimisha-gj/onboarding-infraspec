terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      CreatedBy = format("dev-%s", local.user)
    }
  }
}
