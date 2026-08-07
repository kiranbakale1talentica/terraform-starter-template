# AWS Landing Zone Boilerplate

Enterprise multi-account Control Tower layout:

- `accounts/management`: AWS Organizations parent account setup
- `accounts/security`: Security Hub, GuardDuty, IAM Identity Center
- `accounts/log-archive`: S3 log bucket baselines
- `accounts/shared-services`: Transit Gateway, Shared CI Runners
- `accounts/workloads`: Production, Staging, and Development workload targets
