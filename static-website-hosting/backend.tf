terraform {

  backend "s3" {
    bucket       = "dev-ops-terraform-state-files"
    key          = "static-website-hosting.tfstate"
    region       = "us-east-1"
    use_lockfile = "true"
    encrypt      = true
  }
}