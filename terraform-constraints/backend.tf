terraform {

  backend "s3" {
    bucket       = "seenyor-terraform-state-file"
    key          = "dev/day7terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = "true"
    encrypt      = true
  }
}