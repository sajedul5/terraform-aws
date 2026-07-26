variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = "static-website-hosting-420"
}



variable "primary_region" {
  description = "Primary AWS region for VPC peering"
  type        = string
  default     = "us-east-1"
}


variable "primary_region" {
  description = "Primary AWS region for VPC peering"
  type        = string
  default     = "us-east-1"
}

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
  default     = ""
 }

 variable "secondary_vpc_cidr" {
  description = "CIDR block for the secondary VPC"
  type        = string
  default     = ""
 }


 variable "primary_subnet_cidr" {
  description = "CIDR block for the primary subnet"
  type        = string
  default     = ""
 }


 variable "secondary_subnet_cidr" {
  description = "CIDR block for the secondary subnet"
  type        = string
  default     = ""
 }


 variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = ""
 }

 variable "primary_key_name" {
  description = "Key pair name for the primary region"
  type        = string
  default     = ""
 }

  variable "secondary_key_name" {
    description = "Key pair name for the secondary region"
    type        = string
    default     = ""
  }