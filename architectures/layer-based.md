# Layer-Based Repository Architecture

## Overview
In a **Layer-Based** architecture, infrastructure is organized vertically by functional dependency tier or layer (e.g. `00-base`, `10-vpc`, `20-db`, `30-apps`). Lower layers change infrequently and provide outputs consumed by higher layers.

---

## Folder Structure

```
terraform-root/
├── environments/
│   └── prod/
│       ├── 00-base/                 # IAM, KMS, S3 State Buckets
│       │   ├── main.tf
│       │   └── backend.tf
│       ├── 10-vpc/                  # Networking, Subnets, Transit Gateways
│       │   ├── main.tf
│       │   └── backend.tf
│       ├── 20-db/                   # RDS, ElastiCache, DynamoDB
│       │   ├── main.tf
│       │   └── backend.tf
│       └── 30-apps/                 # EKS, ECS, Lambda, Ingress
│           ├── main.tf
│           └── backend.tf
├── modules/
└── README.md
```

---

## Advantages
- **Minimal Blast Radius**: Application updates in `30-apps` cannot corrupt core network or database state in `10-vpc` or `20-db`.
- **Fast Execution**: `terraform plan` on `30-apps` only evaluates application resources, drastically speeding up CI execution.
- **Strict Role Alignment**: Network engineers own `10-vpc`, Database Administrators own `20-db`, Application teams own `30-apps`.

---

## Limitations
- **Dependency Orchestration**: Applying changes across layers requires strict sequential ordering (`00 -> 10 -> 20 -> 30`).
- **Remote State Chaining**: Requires `terraform_remote_state` data sources or SSM Parameter references between layers.

---

## Best Use Cases
- Mid-to-large enterprises with dedicated Networking, Security, and App DevOps teams.
- Regulated environments requiring strict segregation of duties.
