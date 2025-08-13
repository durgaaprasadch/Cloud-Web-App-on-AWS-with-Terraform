# -----------------------------------------------------------------------------
# Outputs from your Terraform deployment
# These values will be displayed in your terminal after a successful apply.
# -----------------------------------------------------------------------------

output "vpc_id" {
  description = "The ID of the main VPC."
  value       = aws_vpc.main.id
}

output "web_server_public_ip" {
  description = "The public IP address of the web server (if in a public subnet)."
  value       = aws_instance.web_server.public_ip
}

output "rds_endpoint" {
  description = "The endpoint address for the RDS database."
  value       = aws_db_instance.main.address
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for static assets."
  value       = aws_s3_bucket.static_assets.id
}