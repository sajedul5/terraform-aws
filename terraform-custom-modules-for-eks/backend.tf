terraform {

  backend "s3" {
    bucket       = "s3-terraform-state-files-backend" # Replace with your S3 bucket name
    key          = "terraform-custom-modules-for-eks.tfstate"
    region       = "us-east-2"
    use_lockfile = "true"
    encrypt      = true
  }
}