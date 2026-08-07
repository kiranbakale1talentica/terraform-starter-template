provider "aws" {
  region = "{{AWS_REGION}}"

  default_tags {
    tags = {
      Project     = "{{PROJECT_NAME}}"
      ManagedBy   = "Terraform"
      Repository  = "https://github.com/{{GITHUB_ORG}}/{{PROJECT_NAME}}"
    }
  }
}
