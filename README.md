# Terraform Repository Designer (`terraform-starter`)

An enterprise-grade, Markdown-driven AI Agent Skill designed to help DevOps engineers, platform teams, and architects evaluate project requirements, select the optimal Terraform repository architecture, and generate production-ready infrastructure scaffolds with complete security and governance tooling automatically pre-configured.

---

## 🌟 Overview

Starting a new Terraform repository involves critical architectural choices:
- Should code be organized by service, by environment, or by functional layer?
- Should the organization use a Monorepo, Polyrepo, or Landing Zone layout?
- Should the team use plain standard HCL or Terragrunt wrappers?
- How should CI/CD, security scanning (Checkov), linting (TFLint), pre-commit hooks, and auto-generated documentation (terraform-docs) be integrated?

**Terraform Repository Designer** acts as an AI Platform Engineer that automates these decisions deterministically.

---

## 📂 Repository Structure

```
terraform-starter/
├── SKILL.md                          # Main AI Agent Orchestrator & State Machine
├── README.md                         # Project documentation and engineering guide
├── architectures/                    # Architectural Knowledge Base & Decision Matrix
│   ├── ARCHITECTURE_INDEX.md         # Diagnostic decision matrix & scoring rules
│   ├── service-first.md              # Service-oriented architecture specs
│   ├── environment-first.md          # Environment-oriented architecture specs
│   ├── layer-based.md                # Layered state-isolation architecture specs
│   ├── monorepo.md                   # Centralized monorepo architecture specs
│   ├── polyrepo.md                   # Split polyrepo architecture specs
│   ├── landing-zone.md               # AWS multi-account Landing Zone specs
│   ├── strategy-plain-terraform.md   # Standard HCL module strategy
│   └── strategy-terragrunt.md        # DRY Terragrunt wrapper strategy
├── templates/                        # Pre-audited repository scaffolding templates
│   ├── service-first/                # Service-first boilerplate
│   ├── environment-first/            # Environment-first boilerplate
│   ├── layer-based/                  # Layer-based boilerplate
│   ├── monorepo/                     # Monorepo boilerplate
│   ├── polyrepo/                     # Polyrepo boilerplate
│   ├── landing-zone/                 # AWS Landing Zone boilerplate
│   └── terragrunt/                   # Terragrunt wrapper boilerplate
└── governance/                       # Enterprise Security & Quality Controls
    ├── github-actions/               # GitHub Actions CI Workflows (terraform-ci.yml, terragrunt-ci.yml)
    ├── bitbucket-pipelines/          # Bitbucket Pipelines Workflow (bitbucket-pipelines.yml)
    ├── jenkins/                      # Declarative Jenkins Pipeline (Jenkinsfile)
    ├── pre-commit/                   # .pre-commit-config.yaml hook suite
    ├── tflint/                       # .tflint.hcl ruleset
    ├── checkov/                      # .checkov.yaml policy scanner settings
    └── terraform-docs/               # .terraform-docs.yml automated doc generator
```

---

## 🚀 How to Use

### Invoking with an AI Agent
Invoke the skill within your AI agent workspace:
> "Use the terraform-repository-designer skill to bootstrap a new microservice infrastructure repository on AWS."

The agent will automatically execute the 7-step state machine defined in [SKILL.md](file:///c:/Users/kiranb/DevOps-projects/terraform-starter-template/SKILL.md):

1. **Step 1: Understand Project**: Asks 3–5 targeted diagnostic questions (Team size, Account scope, Blast radius, Tooling preference, CI/CD platform).
2. **Step 2: Read Architectures**: Reads reference documents in `architectures/` and scores the decision matrix.
3. **Step 3: Recommend & Justify**: Emits a structured Architecture Decision Report (ADR) detailing why the selected architecture fits best and why alternatives were rejected.
4. **Step 4: Template Selection**: Maps the decision directly to `templates/`.
5. **Step 5: Hydrate Placeholders**: Replaces standard variables (`{{PROJECT_NAME}}`, `{{AWS_REGION}}`, `{{BACKEND_S3_BUCKET}}`).
6. **Step 6: Inject Governance**: Injects selected CI/CD pipeline (GitHub Actions, Bitbucket Pipelines, or Jenkins), Checkov, TFLint, pre-commit, and terraform-docs settings from `governance/`.
7. **Step 7: Scaffold Generation**: Emits the complete hydrated file structure with developer bootstrap commands.

### Systematic Trigger Commands

You can run the full workflow or trigger individual steps using systematic commands:

| Trigger Command | Executed Workflow Phase |
| :--- | :--- |
| **`/bootstrap`** | **Full End-to-End Orchestration**: Runs diagnostic assessment, ADR recommendation, template hydration, and governance injection. |
| **`/assess`** | **Diagnostic Phase**: Asks 3–5 minimal diagnostic questions to gather project scope. |
| **`/recommend`** | **Architecture Decision**: Reads `architectures/` docs and generates an ADR recommendation report. |
| **`/scaffold`** | **Template Generation**: Scaffolds matching codebase from `templates/` and hydrates variables. |
| **`/governance`** | **Governance Injection**: Applies CI/CD (GitHub Actions, Bitbucket Pipelines, Jenkins), Checkov, TFLint, pre-commit, and terraform-docs tooling. |
| **`/verify`** | **Scaffold Verification**: Verifies output completeness and outputs local setup commands (`git init`, `terraform init`). |

---

## 🛡️ Supported Architectures & Strategies

### Repository Organization Patterns
1. **Service-First**: State isolated per microservice stack. Ideal for product teams owning dedicated domains.
2. **Environment-First**: Directory structure split by environment (`dev`, `stage`, `prod`). Ideal for small teams and monoliths.
3. **Layer-Based**: Vertical tier isolation (`00-base`, `10-vpc`, `20-db`, `30-apps`). Ideal for strict tier blast-radius reduction.
4. **Monorepo**: Single Git repository containing all org infrastructure with path-filtered CI/CD.
5. **Polyrepo**: Independent GitHub/Bitbucket repos per component for strict access boundaries.
6. **Landing Zone**: Multi-account AWS Control Tower layout (`management`, `security`, `shared-services`, `workloads`).

### Infrastructure Strategies
1. **Plain Terraform**: Native HCL modules with standard CLI workflows.
2. **Terragrunt**: DRY dynamic backend and provider generation with DAG multi-directory execution.

---

## 🔒 Embedded Governance Suite

Every generated repository automatically includes:
- **Multi-CI/CD Automation**: Pre-packaged pipelines for **GitHub Actions**, **Bitbucket Pipelines**, or **Jenkins** (`fmt`, `validate`, `tflint`, `checkov`, `terraform-docs`).
- **Pre-commit Hooks**: Enforces clean syntax before git commits (`.pre-commit-config.yaml`).
- **TFLint AWS Ruleset**: Static analysis for AWS resource naming and deprecated attributes (`.tflint.hcl`).
- **Checkov Security Policies**: Static vulnerability scanning for cloud compliance (`.checkov.yaml`).
- **Terraform-Docs**: Auto-updates module inputs, outputs, and requirements tables in `README.md`.

---

## ⚖️ License & Maintenance

Designed for long-term enterprise maintenance and modular extension. Add new templates under `templates/` or update scoring rules in `architectures/ARCHITECTURE_INDEX.md` without breaking existing agent workflows.
