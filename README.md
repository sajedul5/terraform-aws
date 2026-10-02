# terraform-aws

A hands-on collection of **Terraform projects for AWS**, from Infrastructure as Code basics to production-style designs such as EKS, high-availability web tiers, blue-green deployments, serverless pipelines and end-to-end monitoring.

Every folder is self-contained, has its own `README.md` (concept, architecture, deploy steps and cleanup), and can be applied and destroyed on its own.

## 🎯 Who This Repo Is For

- **Beginners** who want a clear, step-by-step path into Terraform on AWS
- **DevOps / Cloud engineers** looking for working reference designs to reuse
- **Interview preparation**: state & locking, `count` vs `for_each`, lifecycle rules, VPC design, ALB + ASG, EKS, IAM, monitoring
- **Portfolio**: real infrastructure across networking, compute, containers, serverless, security and observability

## 🗺️ Learning Path

### Part 1: Terraform Fundamentals

| # | Project | What You Learn |
|---|---------|----------------|
| 1 | [into-terraform](into-terraform/) | What IaC is, why Terraform, installation |
| 2 | [terraform-provider](terraform-provider/) | Providers and version constraints |
| 3 | [aws-s3-bucket](aws-s3-bucket/) | First AWS resource, authentication methods |
| 4 | [terraform-state-file](terraform-state-file/) | Remote state in S3, S3 native state locking, state commands, backend migration |
| 5 | [terraform-environment](terraform-environment/) | Input / local / output variables, variable precedence, `tfvars` per environment |
| 6 | [terraform-file-structure](terraform-file-structure/) | Organizing a project into files |
| 7 | [terraform-constraints](terraform-constraints/) | Type constraints: string, number, list, map, object, tuple |
| 8 | [terraform-meta-arguments](terraform-meta-arguments/) | `count`, `for_each`, `depends_on`, `lifecycle`, `provider` |
| 9 | [terraform-lifecycle](terraform-lifecycle/) | `create_before_destroy`, `prevent_destroy`, `ignore_changes`, `replace_triggered_by`, pre/postconditions |
| 10 | [terraform-conditional-expressions](terraform-conditional-expressions/) | Conditional expressions, dynamic blocks, splat expressions |
| 11 | [terraform-functions](terraform-functions/) | Built-in functions through 12 hands-on assignments |

### Part 2: Real-World AWS Projects

| # | Project | AWS Services | Key Skill |
|---|---------|--------------|-----------|
| 12 | [static-website-hosting](static-website-hosting/) | S3, CloudFront, Origin Access Control | Private S3 origin served through a CDN |
| 13 | [2-tier-architecture-setup-on-aws](2-tier-architecture-setup-on-aws/) | VPC, EC2, RDS MySQL, Secrets Manager | Custom modules, private DB subnets, generated DB password |
| 14 | [aws-vpc-peering-terraform](aws-vpc-peering-terraform/) | Multi-region VPCs, VPC Peering, EC2 | Multiple provider aliases, cross-region networking |
| 15 | [highly-available-and-scalable-architecture](highly-available-and-scalable-architecture/) | VPC, NAT Gateway, ALB, Auto Scaling, CloudWatch | Multi-AZ, auto scaling on CPU alarms |
| 16 | [aws-blue-green-deployment](aws-blue-green-deployment/) | Elastic Beanstalk, S3, IAM | Zero-downtime releases and instant rollback |
| 17 | [aws-serverless-lambda](aws-serverless-lambda/) | Lambda, Lambda Layers, S3 events | Event-driven image processing |
| 18 | [end-to-end-observability-in-aws](end-to-end-observability-in-aws/) | CloudWatch Dashboards, Alarms, Metric Filters, SNS | Monitoring, logging and alerting as code |
| 19 | [terraform-aws-policy&governance](terraform-aws-policy%26governance/) | IAM Policies, AWS Config Rules | Compliance enforcement (MFA delete, encryption, required tags) |
| 20 | [terraform-custom-modules-for-eks](terraform-custom-modules-for-eks/) | EKS, Managed Node Groups, IRSA, KMS, Secrets Manager | Production Kubernetes on AWS with custom modules |

## 🛠️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) **>= 1.10** (required for S3 native state locking)
- [AWS CLI v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), configured with `aws configure` or an SSO profile
- An AWS account with permissions for the services used
- Optional: `kubectl` (EKS project), Docker (Lambda layer builds), Node.js (blue-green apps)

## 🗄️ Remote State Backend

Projects store state in a shared S3 bucket with encryption and S3 native locking (no DynamoDB table needed):

```hcl
terraform {
  backend "s3" {
    bucket       = "s3-terraform-state-files-backend" # change to your bucket
    key          = "<project-name>.tfstate"
    region       = "us-east-2"
    use_lockfile = true
    encrypt      = true
  }
}
```

Before running `terraform init`, create the bucket with versioning enabled, or update `bucket` / `region` in each project's `backend.tf`. Keep `key` unique per project so state files do not overwrite each other.

## 🚀 Quick Start

```bash
git clone https://github.com/sajedul5/terraform-aws.git
cd terraform-aws/<project-folder>

cp terraform.tfvars.example terraform.tfvars   # if the project provides one
terraform init
terraform plan
terraform apply

# When finished, always clean up to avoid charges
terraform destroy
```

## 📁 Repository Structure

```
terraform-aws/
├── into-terraform/                          # IaC & Terraform introduction
├── terraform-provider/                      # Providers & versioning
├── aws-s3-bucket/                           # First AWS resource
├── terraform-state-file/                    # Remote state & locking
├── terraform-environment/                   # Variables & environments
├── terraform-file-structure/                # Project organization
├── terraform-constraints/                   # Type constraints
├── terraform-meta-arguments/                # count, for_each, depends_on ...
├── terraform-lifecycle/                     # Lifecycle rules & conditions
├── terraform-conditional-expressions/       # Conditionals, dynamic blocks, splat
├── terraform-functions/                     # Built-in functions
├── static-website-hosting/                  # S3 + CloudFront
├── 2-tier-architecture-setup-on-aws/        # VPC + EC2 + RDS (modules)
├── aws-vpc-peering-terraform/               # Cross-region VPC peering
├── highly-available-and-scalable-architecture/  # ALB + ASG + NAT
├── aws-blue-green-deployment/               # Elastic Beanstalk blue-green
├── aws-serverless-lambda/                   # Lambda image processor
├── end-to-end-observability-in-aws/         # CloudWatch + SNS monitoring
├── terraform-aws-policy&governance/         # IAM + AWS Config
└── terraform-custom-modules-for-eks/        # EKS with custom modules
```

## ✅ Practices Used Across the Repo

- Remote, encrypted state with S3 native locking
- Pinned Terraform and provider versions
- Reusable custom modules (VPC, EC2, RDS, IAM, EKS, Secrets Manager, CloudWatch)
- Secrets kept out of code: `*.tfvars` git-ignored, `sensitive` variables, AWS Secrets Manager
- Encryption at rest with KMS / SSE and S3 public access blocks
- Consistent resource tagging
- Clear cleanup steps in every project

## ⚠️ Cost Warning

Some projects create billable resources (NAT Gateways, ALBs, RDS, EKS, Elastic Beanstalk). Run `terraform destroy` when you finish testing.

## 🤝 Contributing

Issues and pull requests are welcome. Please run `terraform fmt -recursive` and `terraform validate` before submitting.

---

## Copyright

© 2026 Md Sajedul Islam, DevOps Engineer. All rights reserved.
