# Terraform Repository Designer (`terraform-starter`)

A Markdown-driven AI Agent Skill designed to help platform engineers evaluate project requirements, select Terraform repository architectures, and generate standardized repository scaffolds with security and governance tooling configured.

---

## Overview

Bootstrapping a Terraform repository requires architectural decisions:
- Repository organization (Service-first, Environment-first, Layer-based, Monorepo, Polyrepo, Landing Zone).
- Infrastructure orchestration strategy (Plain Terraform or Terragrunt).
- CI/CD automation and quality controls (GitHub Actions, Bitbucket Pipelines, Jenkins, TFLint, Checkov, pre-commit, terraform-docs).

This framework provides documented decision matrix rules, template structures, and governance defaults to automate repository scaffolding.

---

## Repository Structure

```
terraform-starter/
├── SKILL.md                          # AI Agent skill definition and workflow rules
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

## Usage Guide

### Agent Invocation

Invoke the skill within an AI agent environment:

> "Use the terraform-repository-designer skill to bootstrap a new microservice infrastructure repository on AWS."

The agent executes the workflow defined in [SKILL.md](file:///c:/Users/kiranb/DevOps-projects/terraform-starter-template/SKILL.md):

1. **Step 1: Project Assessment**: Collects required diagnostic parameters (Team size, Account scope, Blast radius, Tooling preference, CI/CD platform).
2. **Step 2: Read Architecture Specifications**: Reads reference documents in `architectures/` to score the decision matrix.
3. **Step 3: Recommend Architecture**: Emits an Architecture Decision Record (ADR) detailing selection rationale, trade-offs, and alternative analysis.
4. **Step 4: Select Template**: Selects the matching template from `templates/`.
5. **Step 5: Hydrate Placeholders**: Replaces standard variables (`{{PROJECT_NAME}}`, `{{AWS_REGION}}`, `{{BACKEND_S3_BUCKET}}`).
6. **Step 6: Inject Governance**: Copies target CI/CD pipeline (GitHub Actions, Bitbucket Pipelines, or Jenkins), Checkov, TFLint, pre-commit, and terraform-docs settings.
7. **Step 7: Generate Repository**: Outputs the scaffolded directory structure and bootstrap commands.

### Workflow Commands

The framework supports step-by-step trigger commands:

| Command | Workflow Phase | Description |
| :--- | :--- | :--- |
| **`/bootstrap`** | Steps 1 – 7 | Executes the complete workflow from diagnosis to code generation. |
| **`/assess`** | Step 1 | Gathers project diagnostic parameters. |
| **`/recommend`** | Steps 2 & 3 | Reads `architectures/` specifications and generates an ADR report. |
| **`/scaffold`** | Steps 4 & 5 | Selects the matching template and hydrates variable placeholders. |
| **`/governance`** | Step 6 | Applies CI/CD, linting, security, and documentation configurations. |
| **`/verify`** | Step 7 | Validates generated output and provides local setup steps. |

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
