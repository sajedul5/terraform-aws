terraform {

  backend "s3" {
    bucket       = "dev-ops-terraform-state-files"
    key          = "aws-blue-green-deployment.tfstate"
    region       = "us-east-1"
    use_lockfile = "true"
    encrypt      = true
  }
}