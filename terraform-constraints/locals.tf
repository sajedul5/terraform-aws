locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    LOB         = "Engineering"
    Stage       = "Alpha"
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
  }

  vpc_cidr    = var.network_config[0]
  subnet_cidr = var.network_config[1]

  instance_name = "${var.environment}-instance"

  port_description = {
    22  = "SSH"
    80  = "HTTP"
    443 = "HTTPS"
  }
}