# Service-First Repository Architecture

## Overview
In a **Service-First** architecture, infrastructure code is organized around business services or application domains (e.g. `payment-service`, `auth-service`, `notification-service`). Each service maintains its own isolated Terraform state file and configuration.

---

## Folder Structure

```
terraform-root/
├── modules/                         # Reusable internal modules
│   ├── ecs-service/
│   ├── rds-aurora/
│   └── s3-bucket/
├── services/                        # Service application infrastructure
│   ├── payment-service/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── backend.tf
│   │   └── terraform.tfvars
│   ├── auth-service/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── backend.tf
│   └── notification-service/
│       ├── main.tf
│       └── backend.tf
├── .github/workflows/
└── README.md
```

---

## Advantages
- **Isolated Blast Radius**: A failure or state corruption during `terraform apply` in `payment-service` has zero impact on `auth-service`.
- **Domain Alignment**: Service development teams own their infrastructure stack end-to-end.
- **Independent CI/CD**: Changes to `payment-service/` only trigger pipelines for that specific service.

---

## Limitations
- **Cross-Service Dependencies**: Sharing data outputs between services requires explicit remote state lookups (`terraform_remote_state`) or SSM Parameter Store references.
- **Potential Code Duplication**: Without central modules in `modules/`, boilerplate can drift between services.

---

## Best Use Cases
- Microservice architectures owned by independent product engineering teams.
- Applications where services have distinct lifecycles and deployment cadences.
