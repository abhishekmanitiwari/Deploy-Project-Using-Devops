output "instance_public_ip" {
  value = aws_instance.server.public_ip
}

output "s3_bucket_name" {
  description = "S3 bucket name for storage"
  value       = "your-actual-s3-bucket-name"
}
