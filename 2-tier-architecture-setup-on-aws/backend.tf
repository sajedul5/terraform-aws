terraform {

  backend "s3" {
    bucket       = "s3-terraform-state-files-backend"
    key          = "2-tier-architecture-rds-demo.tfstate"
    region       = "us-east-1"
    use_lockfile = "true"
    encrypt      = true
  }
}