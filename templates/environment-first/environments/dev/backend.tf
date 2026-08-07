terraform {
  backend "s3" {
    bucket       = "{{BACKEND_S3_BUCKET}}"
    key          = "environments/dev/terraform.tfstate"
    region       = "{{AWS_REGION}}"
    encrypt      = true
    use_lockfile = true
  }
}
