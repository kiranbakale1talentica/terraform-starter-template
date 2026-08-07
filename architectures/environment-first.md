# Environment-First Repository Architecture

## Overview
In an **Environment-First** architecture, the primary top-level organizational directory is structured by environment target (e.g. `environments/dev`, `environments/stage`, `environments/prod`).

---

## Folder Structure

```
terraform-root/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── backend.tf
│   │   └── terraform.tfvars
│   ├── stage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   └── backend.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── providers.tf
│       └── backend.tf
├── modules/                         # Centralized reusable modules
│   ├── vpc/
│   └── eks-cluster/
├── .github/workflows/
└── README.md
```

---

## Advantages
- **Simple Conceptual Model**: Highly intuitive for engineers transitioning from monolithic infrastructure.
- **Clear Environment Boundaries**: Dev, Stage, and Prod configurations and state files are explicitly isolated into subdirectories.
- **Easy Variable Scoping**: Simple to pass environment-specific values via `terraform.tfvars`.

---

## Limitations
- **High Blast Radius within Environment**: An update in `environments/prod/main.tf` touches all production infrastructure simultaneously unless subdivided.
- **Code Duplication**: HCL configuration across `dev`, `stage`, and `prod` can duplicate unless extracted into `modules/`.

---

## Best Use Cases
- Small engineering teams (1-10 engineers).
- Simple monoliths or early-stage startup infrastructure stacks.
