# Polyrepo Infrastructure Architecture

## Overview
In a **Polyrepo** architecture, infrastructure components are split across multiple independent Git repositories (e.g. `repo-infra-vpc`, `repo-infra-database`, `repo-infra-payments`).

---

## Folder Structure (Example: `repo-infra-payments`)

```
repo-infra-payments/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── backend.tf
├── .github/workflows/ci.yml
└── README.md
```

---

## Advantages
- **Strict Access Control**: Fine-grained GitHub repository permissions (e.g. only DBAs have write access to `repo-infra-database`).
- **Simpler CI/CD Pipelines**: Standard trigger on `push` to `main` without complex path filtering.
- **Isolated PR Scope**: Pull requests are compact and focused on a single component.

---

## Limitations
- **Repository Proliferation**: Managing dozens or hundreds of repositories introduces administrative overhead.
- **Governance Drift**: Keeping pre-commit hooks, CI workflows, and linters synchronized across repos requires specialized automation (e.g. GitHub Repository Files Sync).

---

## Best Use Cases
- Highly autonomous enterprise teams with strict compliance and RBAC access boundaries.
- Organizations with independent lines of business.
