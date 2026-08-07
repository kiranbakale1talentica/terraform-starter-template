terraform {
  backend "s3" {
    bucket         = "{{BACKEND_S3_BUCKET}}"
    key            = "environments/prod/terraform.tfstate"
    region         = "{{AWS_REGION}}"
    dynamodb_table = "{{BACKEND_DYNAMODB_TABLE}}"
    encrypt        = true
  }
}
