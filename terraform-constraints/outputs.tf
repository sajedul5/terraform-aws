output "instance_id" {
  value = aws_instance.web_server[0].id
}

output "instance_public_ip" {
  value = aws_instance.web_server[0].public_ip
}

output "instance_private_ip" {
  value = aws_instance.web_server[0].private_ip
}

output "instance_type" {
  value = aws_instance.web_server[0].instance_type
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "environment_info" {
  value = {
    environment = var.environment
    region      = var.region
  }
}

output "storage_info" {
  value = {
    disk_size_gb = var.storage_size
    disk_size_mb = var.storage_size * 1024
  }
}

output "allowed_cidr_blocks" {
  value = var.allowed_cidr_blocks
}

output "allowed_instance_types" {
  value = var.allowed_instance_types
}

output "instance_tags" {
  value = var.instance_tags
}

output "availability_zones" {
  value = var.availability_zones
}

output "network_configuration" {
  value = {
    vpc_cidr    = var.network_config[0]
    subnet_cidr = var.network_config[1]
    port        = var.network_config[2]
  }
}

output "server_configuration" {
  value = var.server_config
}

output "common_tags" {
  value = local.common_tags
}