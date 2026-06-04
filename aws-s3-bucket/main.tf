terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "us-east-1"
}

# Create a S3 bucket
resource "aws_s3_bucket" "tf_test_baivab_bucket" {
  bucket = "my-tf-test-bucket-101999999"

  tags = {
    Name        = "My bucket v-2.0"
    Environment = "Dev"
  }
}

