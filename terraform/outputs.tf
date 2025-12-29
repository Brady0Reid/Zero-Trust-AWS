output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "log_bucket_name" {
  description = "S3 bucket used for CloudTrail logs"
  value       = aws_s3_bucket.logs.bucket
}

output "ec2_role_name" {
  description = "IAM role assigned to EC2"
  value       = aws_iam_role.ec2_role.name
}
