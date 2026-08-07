variable "aws_region" {
  type        = string
  description = "Target AWS deployment region"
  default     = "{{AWS_REGION}}"
}

variable "environment" {
  type        = string
  description = "Deployment target environment (dev, stage, prod)"
  default     = "dev"
}

variable "project_name" {
  type        = string
  description = "Name of the project or service"
  default     = "{{PROJECT_NAME}}"
}
