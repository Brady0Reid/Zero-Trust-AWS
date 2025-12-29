# Architecture Overview

This project implements a Zero Trust architecture where identity is the primary security control.

## Access Flow
1. User assumes IAM role using AWS STS
2. Permissions evaluated via least-privilege policies
3. EC2 accessed via SSM only
4. All actions logged via CloudTrail

## Network Design
- Private subnets only
- No public IP addresses
- VPC endpoints for AWS service access
