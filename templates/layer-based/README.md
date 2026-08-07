# Layer-Based Template

Infrastructure layers isolate state by change frequency:

- `00-base`: IAM roles, S3 buckets, KMS keys
- `10-vpc`: Networking, VPCs, Subnets, Gateways
- `20-db`: Relational databases, caching, stateful data stores
- `30-apps`: EKS, ECS, Serverless, Ingress Controllers

Execute `terraform apply` sequentially from layer 00 up to layer 30.
