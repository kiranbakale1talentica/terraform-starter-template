# Plain Terraform Strategy

## Overview
**Plain Terraform** uses standard HashiCorp HCL files (`main.tf`, `variables.tf`, `outputs.tf`, `backend.tf`, `providers.tf`) and standard module references without external CLI wrapper dependencies.

---

## Technical Characteristics
- **Standard Tooling**: Uses native `terraform` binary (`terraform init`, `terraform plan`, `terraform apply`).
- **Explicit Configurations**: Every directory containing a state root explicitly declares its provider configuration and backend block.
- **Module Abstraction**: Code reuse is accomplished by invoking internal modules (`source = "../../modules/vpc"`) or external registry modules.

---

## Trade-Offs
- **Pros**: Zero third-party wrapper dependencies; supported natively by all CI/CD systems, HCP Terraform (Terraform Cloud), and Spacelift; low learning curve.
- **Cons**: Backend configurations and provider blocks must be defined in every environment directory (requires copy-paste or template generation).
