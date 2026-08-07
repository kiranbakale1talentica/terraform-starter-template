terraform {
  required_version = "{{TERRAFORM_VERSION}}"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
