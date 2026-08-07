# Terragrunt Strategy

## Overview
**Terragrunt** is a lightweight wrapper for Terraform that provides extra tools for keeping your configurations DRY (Don't Repeat Yourself), working with multiple Terraform modules, and managing remote state across multiple environments.

---

## Technical Characteristics
- **DRY Backends**: Parent `terragrunt.hcl` dynamically generates S3 backend configurations and DynamoDB locks for all child directories.
- **DRY Providers**: Root `terragrunt.hcl` generates standard AWS provider blocks with default tags and region configurations.
- **`terragrunt run-all`**: Execute plans/applies across multiple directories in DAG (Directed Acyclic Graph) order.

---

## Folder Structure

```
terragrunt-root/
├── terragrunt.hcl                   # Root configuration (Backend & Provider generation)
├── env.hcl                          # Environment-level variables
├── dev/
│   ├── env.hcl
│   ├── vpc/
│   │   └── terragrunt.hcl          # Invokes module & overrides inputs
│   └── app/
│       └── terragrunt.hcl
└── prod/
    ├── env.hcl
    ├── vpc/
    │   └── terragrunt.hcl
    └── app/
        └── terragrunt.hcl
```

---

## Trade-Offs
- **Pros**: Completely eliminates duplicate backend and provider HCL blocks; seamless multi-account dynamic state configuration; built-in DAG dependency management (`dependencies` block).
- **Cons**: Requires team adoption of `terragrunt` CLI binary; additional abstraction layer over standard Terraform.
