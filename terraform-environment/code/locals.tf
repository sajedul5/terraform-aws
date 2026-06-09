# Local Variables - Internal variables for reusability
locals {
  environment = var.environment != "" ? var.environment : terraform.workspace

  common_tags = {
    Environment = local.environment
    Project     = "Terraform-Demo"
    Owner       = "DevOps-Team"
  }

  full_bucket_name = "${local.environment}-${var.bucket_name}-${random_string.suffix.result}"
}

# Random string for unique bucket naming
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
