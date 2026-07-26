variable "primary_region" {
  description = "Primary AWS region for VPC peering"
  type        = string
  default     = "us-east-1"
}

variable "secondary_region" {
  description = "Secondary AWS region for VPC peering"
  type        = string
  default     = "us-west-2"
}

variable "primary_vpc_cidr" {
  description = "CIDR block for the primary VPC"
  type        = string
}

variable "secondary_vpc_cidr" {
  description = "CIDR block for the secondary VPC"
  type        = string
}

variable "primary_subnet_cidr" {
  description = "CIDR block for the primary subnet"
  type        = string
}

variable "secondary_subnet_cidr" {
  description = "CIDR block for the secondary subnet"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "primary_key_name" {
  description = "Key pair name for the primary region"
  type        = string
}

variable "secondary_key_name" {
  description = "Key pair name for the secondary region"
  type        = string
}