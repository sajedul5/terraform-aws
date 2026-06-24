terraform {

  backend "s3" {
    bucket       = "dev-ops-terraform-state-files"
    key          = "terraform-lifecycle.tfstate"
    region       = "us-east-1"
    use_lockfile = "true"
    encrypt      = true
  }
}