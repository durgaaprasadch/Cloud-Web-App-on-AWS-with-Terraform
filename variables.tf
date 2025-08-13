variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "ssh_key_name" {
  description = "The name of your existing SSH Key Pair in AWS for EC2 instances."
  type        = string
  default     = "my-app-key"
}

variable "db_password" {
  description = "The password for the RDS PostgreSQL database."
  type        = string
  default     = ""
  sensitive   = true
}
