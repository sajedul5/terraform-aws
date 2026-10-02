terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }

  backend "s3" {
    bucket         = "s3-terraform-state-files-backend"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    use_lockfile  = "true"
    encrypt        = true
  }
}