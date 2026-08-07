# Architecture Decision Matrix & Index

This index provides a deterministic comparison matrix and lookup table for evaluating Terraform repository architectures and infrastructure strategies.

---

## Architecture Comparison Matrix

| Architecture | Ideal Team Size | AWS Account Model | Blast Radius | Code Duplication | Velocity | Operational Complexity | Best Use Case |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Service-First** | 5 - 50+ | Single or Multi-Account | **Low** (Isolated per service) | Low (Shared modules) | **High** (Teams work independently) | Medium | Microservices, product teams owning dedicated application stacks |
| **Environment-First** | 1 - 10 | Single or Few Accounts | **Medium** (Blast radius per environment) | Medium (Duplicated env files) | High for small teams | Low | Early-stage startups, monolithic applications, simple stacks |
| **Layer-Based** | 10 - 100+ | Multi-Account | **Very Low** (State split by infrastructure tier) | Low | Medium (Sequential changes) | High | Enterprise networks, shared foundational platforms, strict security tiers |
| **Monorepo** | 10 - 200+ | Multi-Account | **Low** (Directory isolated state) | Minimal (Centralized modules) | High with Path-filtering CI | High (Requires CI path filtering) | Mid-to-large organizations with strong DevOps platform standards |
| **Polyrepo** | 50+ | Multi-Account | **Very Low** (Repository per component) | Low | High per repo / Low overall | **Very High** (Repo proliferation) | Highly autonomous enterprise teams with strict access boundaries |
| **Landing Zone** | Platform Teams | Multi-Account (Control Tower) | **Extremely Low** (Account level isolation) | Minimal | High for tenant teams | **High** | Multi-account enterprise foundations, security hubs, core networking |

---

## Infrastructure Strategy Matrix

| Strategy | Orchestration Tool | Code Reuse Mechanism | DRY Level | Learning Curve | Best Use Case |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Plain Terraform** | Standard `terraform` CLI | Custom Terraform Modules | Medium | Low | Standard teams, native HCL adherence, simple CI pipelines |
| **Terragrunt** | `terragrunt` CLI wrapper | `terragrunt.hcl` inherit & include | **Extremely High** | Medium | Large multi-account, multi-environment setups needing zero duplication |

---

## Architecture Selection Flowchart

```
Start Assessment
  │
  ├─► Is this building a central multi-account AWS foundation / Landing Zone?
  │     └─► YES ──► Recommendation: LANDING ZONE
  │
  ├─► Are infrastructure tiers strictly separated by team boundaries (Network vs Data vs Apps)?
  │     └─► YES ──► Recommendation: LAYER-BASED
  │
  ├─► Is the team structured around independent microservices / product domains?
  │     └─► YES ──► Recommendation: SERVICE-FIRST
  │
  ├─► Is this a small team / single monolith with simple environments?
  │     └─► YES ──► Recommendation: ENVIRONMENT-FIRST
  │
  ├─► Are strict security boundaries required between repos for compliance?
  │     └─► YES ──► Recommendation: POLYREPO
  │
  └─► Default for enterprise organizations wanting single source of truth:
        └─► Recommendation: MONOREPO
```
