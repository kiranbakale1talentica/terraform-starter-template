# Terraform Repository Designer (`terraform-starter`)

A Markdown-driven AI Agent Skill designed to help platform engineers evaluate project requirements, select Terraform repository architectures, and generate standardized repository scaffolds inside dedicated project folders (`./<PROJECT_NAME>/`) with pre-configured governance and automated verification.

---

## Overview

Bootstrapping a Terraform repository requires architectural decisions:
- Repository organization (Service-first, Environment-first, Layer-based, Monorepo, Polyrepo, Landing Zone).
- Infrastructure orchestration strategy (Plain Terraform or Terragrunt).
- CI/CD automation and quality controls (GitHub Actions, Bitbucket Pipelines, Jenkins, TFLint, Checkov, pre-commit, terraform-docs).

This framework provides documented decision matrix rules, template structures, and governance defaults. Scaffolding is executed through a 5-phase lifecycle with automated governance application and next-steps verification guidance.

---

## Repository Structure

```
terraform-starter/
├── SKILL.md                          # AI Agent skill definition and 5-phase lifecycle rules
├── README.md                         # Framework documentation
├── architectures/                    # Architectural decision matrix and specifications
│   ├── ARCHITECTURE_INDEX.md         # Architecture decision matrix and selection index
│   ├── service-first.md              # Service-first architecture specification
│   ├── environment-first.md          # Environment-first architecture specification
│   ├── layer-based.md                # Layer-based architecture specification
│   ├── monorepo.md                   # Monorepo architecture specification
│   ├── polyrepo.md                   # Polyrepo architecture specification
│   ├── landing-zone.md               # Landing Zone multi-account specification
│   ├── strategy-plain-terraform.md   # Plain Terraform strategy guide
│   └── strategy-terragrunt.md        # Terragrunt strategy guide
├── templates/                        # Repository templates
│   ├── service-first/                # Service-first template files
│   ├── environment-first/            # Environment-first template files
│   ├── layer-based/                  # Layer-based template files
│   ├── monorepo/                     # Monorepo template files
│   ├── polyrepo/                     # Polyrepo template files
│   ├── landing-zone/                 # Landing Zone template files
│   └── terragrunt/                   # Terragrunt template files
└── governance/                       # Security and CI/CD governance configurations
    ├── github-actions/               # GitHub Actions CI workflows
    ├── bitbucket-pipelines/          # Bitbucket Pipelines configuration
    ├── jenkins/                      # Declarative Jenkinsfile
    ├── pre-commit/                   # Pre-commit configuration
    ├── tflint/                       # TFLint ruleset configuration
    ├── checkov/                      # Checkov static security policy
    └── terraform-docs/               # Automated terraform-docs configuration
```

---

## 5-Phase Lifecycle Workflow

```
┌────────────────────────────────────────────────────────┐
│ PHASE 1: Assessment (/assess)                         │
│ Collect Project Name, Infra Goal, Cloud Scope, CI/CD   │
└───────────────────────────┬────────────────────────────┘
                            │ (Emit Spec & STOP)
                            ▼
┌────────────────────────────────────────────────────────┐
│ PHASE 2: Recommendation (/recommend)                   │
│ Read architectures/, Score Matrix, Emit ADR Report     │
└───────────────────────────┬────────────────────────────┘
                            │ (Emit ADR & STOP for Approval)
                            ▼
┌────────────────────────────────────────────────────────┐
│ PHASE 3: Scaffolding (/scaffold)                       │
│ Hydrate template into ./<PROJECT_NAME>/                │
└───────────────────────────┬────────────────────────────┘
                            │ (Automatic Transition)
                            ▼
┌────────────────────────────────────────────────────────┐
│ PHASE 4: Governance (/governance)                      │
│ Inject CI/CD, pre-commit, TFLint, Checkov, docs        │
└───────────────────────────┬────────────────────────────┘
                            │ (Automatic Transition)
                            ▼
┌────────────────────────────────────────────────────────┐
│ PHASE 5: Verification & Next Steps (/verify)           │
│ Validate repository completeness & output next steps   │
└────────────────────────────────────────────────────────┘
```

---

## Workflow Commands

| Command | Executed Lifecycle Phases | Execution & Stop Gate |
| :--- | :--- | :--- |
| **`/assess`** | **Phase 1** | Gathers minimum project parameters (Project Name, Infra goal, Cloud scope, CI/CD platform) and **stops**. |
| **`/recommend`** | **Phase 2** | Reads `architectures/`, scores decision matrix, emits ADR Report, and **stops for user approval**. |
| **`/scaffold`** | **Phases 3, 4 & 5** | Hydrates matching template into `./<PROJECT_NAME>/`, applies Governance, executes Verification, and automatically suggests Next Steps. |
| **`/governance`** | **Phase 4** | Injects selected CI/CD pipeline (GitHub Actions, Bitbucket Pipelines, Jenkins), Checkov, TFLint, pre-commit, and terraform-docs configs. |
| **`/verify`** | **Phase 5** | Validates generated repository completeness and automatically suggests next-step setup commands. |
| **`/bootstrap`** | **Phases 1 -> 5** | Executes full lifecycle with **mandatory approval stops after Phase 1 and Phase 2**. |

---

## Output Location & Governance Setup

All generated repository files, HCL configurations, and governance policies are placed inside a **new dedicated root directory named after the project**:

```
./<PROJECT_NAME>/
├── .github/ (or bitbucket-pipelines.yml / Jenkinsfile)
├── .pre-commit-config.yaml
├── .tflint.hcl
├── .checkov.yaml
├── .terraform-docs.yml
├── README.md
├── main.tf / services / environments / layers
└── providers.tf / backend.tf / variables.tf
```

---

## Supported Architectures

### Organization Patterns
1. **Service-First**: State isolated per microservice stack.
2. **Environment-First**: Structure organized by environment (`dev`, `stage`, `prod`).
3. **Layer-Based**: Vertical tier isolation (`00-base`, `10-vpc`, `20-db`, `30-apps`).
4. **Monorepo**: Single Git repository containing all infrastructure configurations.
5. **Polyrepo**: Independent Git repository per component.
6. **Landing Zone**: Multi-account AWS environment baseline (`management`, `security`, `shared-services`, `workloads`).

### Infrastructure Strategies
1. **Plain Terraform**: Native HCL module structure.
2. **Terragrunt**: DRY configuration management using Terragrunt wrappers.

---

## Governance Components

Scaffolded repositories include:
- **CI/CD Automation**: Configurations for GitHub Actions, Bitbucket Pipelines, or Jenkins (`fmt`, `validate`, `tflint`, `checkov`, `terraform-docs`).
- **Pre-commit Hooks**: Pre-commit validation rules (`.pre-commit-config.yaml`).
- **TFLint AWS Ruleset**: Static analysis for Terraform HCL (`.tflint.hcl`).
- **Checkov Security Rules**: Static security and compliance analysis (`.checkov.yaml`).
- **Terraform-Docs**: Automated documentation generation (`.terraform-docs.yml`).

---

## Maintenance

To extend the framework:
- Add or modify architecture specifications under `architectures/`.
- Add or modify template files under `templates/`.
- Update organizational defaults under `governance/`.
