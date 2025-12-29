# Issues and Resolutions

## CloudTrail Bucket Access Denied
**Cause:** Restrictive bucket policy  
**Resolution:** Verified access denial was intentional to protect audit logs  
**Outcome:** Log integrity preserved

## Terraform Permission Errors
**Cause:** Insufficient IAM permissions  
**Resolution:** Iteratively refined least-privilege policies  
**Outcome:** Successful Terraform apply

## Private Subnet Connectivity
**Cause:** No internet access from private subnets  
**Resolution:** Implemented VPC endpoints  
**Outcome:** Secure service access without public exposure
