terraform {

  backend "s3" {
    bucket       = "dev-ops-terraform-state-files" # change this to your S3 bucket name
    key          = "aws-vpc-peering.tfstate"
    region       = "us-east-1"
    use_lockfile = "true"
    encrypt      = true
  }
}