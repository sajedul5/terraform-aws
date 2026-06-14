variable "environment" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "storage_size" {
  type    = number
  default = 8
}

variable "enable_monitoring" {
  type    = bool
  default = false
}

variable "associate_public_ip" {
  type    = bool
  default = true
}

variable "allowed_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "allowed_instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t3.micro"]
}

variable "instance_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-course"
    Owner       = "devops-team"
  }
}

variable "availability_zones" {
  type    = set(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "network_config" {
  type    = tuple([string, string, number])
  default = ["10.0.0.0/16", "10.0.1.0/24", 80]
}

variable "server_config" {
  type = object({
    name           = string
    instance_type  = string
    monitoring     = bool
    storage_gb     = number
    backup_enabled = bool
  })

  default = {
    name           = "web-server"
    instance_type  = "t2.micro"
    monitoring     = true
    storage_gb     = 20
    backup_enabled = false
  }
}