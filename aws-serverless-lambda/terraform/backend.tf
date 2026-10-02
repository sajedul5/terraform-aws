terraform {

  backend "s3" {
    bucket       = "s3-terraform-state-files-backend"
    key          = "aws-serverless-lambda.tfstate"
    region       = "us-east-2"
    use_lockfile = "true"
    encrypt      = true
  }
}