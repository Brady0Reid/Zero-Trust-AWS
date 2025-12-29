# Security Controls

## Identity & Access
- IAM roles only (no static credentials)
- Least privilege enforcement
- Temporary credentials via STS

## Network Security
- No inbound internet access
- No SSH
- VPC endpoints restrict traffic paths

## Logging & Audit
- CloudTrail enabled
- Logs stored in protected S3 buckets
- Explicit deny policies prevent tampering
