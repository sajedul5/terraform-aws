terraform {

  backend "s3" {
    bucket       = "s3-terraform-state-files-backend"
    key          = "meta-arguments-terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = "true"
    encrypt      = true
  }
}