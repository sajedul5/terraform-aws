terraform {

  backend "s3" {
    bucket       = "s3-terraform-state-files-backend" # change this to your S3 bucket name
    key          = "static-website-hosting.tfstate"
    region       = "us-east-2"
    use_lockfile = "true"
    encrypt      = true
  }
}