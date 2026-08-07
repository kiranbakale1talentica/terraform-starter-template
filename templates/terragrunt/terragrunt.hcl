# Root Terragrunt Configuration

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "{{BACKEND_S3_BUCKET}}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "{{AWS_REGION}}"
    dynamodb_table = "{{BACKEND_DYNAMODB_TABLE}}"
    encrypt        = true
  }
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "{{AWS_REGION}}"
  default_tags {
    tags = {
      Project   = "{{PROJECT_NAME}}"
      ManagedBy = "Terragrunt"
    }
  }
}
EOF
}
