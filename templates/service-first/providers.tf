provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "{{PROJECT_NAME}}"
      ManagedBy   = "Terraform"
      Repository  = "https://github.com/{{GITHUB_ORG}}/{{PROJECT_NAME}}"
    }
  }
}
