provider "aws" {
  region = local.region
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      CreatedBy = format("dev-%s", local.user)
    }
  }
}
