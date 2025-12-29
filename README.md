# 🔐 Zero Trust AWS Cloud Security Lab

## 📌 Overview
This project demonstrates a **Zero Trust cloud security architecture** implemented in AWS using **identity-first access, private networking, centralized logging, and Infrastructure as Code (Terraform)**.

The environment was intentionally designed with:
- ❌ No public EC2 access
- 🔐 IAM role-based authentication
- 📜 Full audit logging
- 🌐 Private service access via VPC endpoints

This lab reflects **real-world enterprise cloud security practices**, focusing on **prevention, visibility, and auditability** rather than convenience.

---

## 🧩 Infrastructure as Code (Terraform)

### ✅ Successful Deployment
![Terraform Apply](screenshots/terraform-apply-success.png)

All infrastructure components were provisioned using Terraform, ensuring:
- Repeatable deployments  
- No manual console configuration  
- Clear change tracking and rollback capability  

---

### 📋 Terraform State Validation
![Terraform State](screenshots/terraform-state-resources.png)

Terraform state tracking confirms:
- All AWS resources are under management
- Drift detection is possible
- Governance and lifecycle control are enforced

---

## 🔐 Identity & Access Management (IAM)

### 🧾 IAM Roles Created via Terraform
![IAM Terraform](screenshots/IAM-Terraform.png)

IAM roles are defined entirely as code, enforcing:
- No long-term access keys
- Role-based access instead of user-based permissions
- Alignment with least-privilege principles

---

### 🚫 Zero Trust IAM Policy Enforcement
![IAM Zero Trust](screenshots/IAM-zero-trust.png)

Policies are written with an **explicit allow / implicit deny** model:
- Only required actions are permitted
- All other actions are denied by default
- Prevents privilege creep and accidental overexposure

---

### 🔁 Secure Role Assumption (STS)
![STS Role](screenshots/sts-role.png)

AWS STS is used to issue **temporary credentials**, which:
- Expire automatically
- Reduce blast radius
- Prevent misuse of static credentials

---

## 🖥️ Secure Compute (EC2)

### 🚫 Private EC2 Instance (No Public IP)
![Private EC2](screenshots/ec2-private-zero-trust.png)

EC2 instances are deployed without public IP addresses:
- No SSH access
- No inbound internet exposure
- Administrative access restricted to approved AWS services and identities

---

## 🌐 Private Networking & VPC Endpoints

### 🔒 S3 Access via VPC Endpoint
![VPC S3 Endpoint](screenshots/vpc-s3-endpoint.png)

VPC endpoints ensure:
- AWS service traffic stays on the AWS backbone
- No dependency on internet gateways or NAT for management traffic
- Reduced attack surface and improved data security

---

## 🪣 Secure Storage (S3)

### 🔐 S3 Bucket Permissions
![S3 Permissions](screenshots/s3-bucket-permissions.png)

S3 buckets are configured with restrictive policies to:
- Protect CloudTrail and CloudWatch logs
- Prevent unauthorized reads or writes
- Enforce centralized logging integrity

---

### 🚫 Public Access Blocked
![S3 Public Access Block](screenshots/s3-public-access-block.png)

Public access is blocked at both the account and bucket level, ensuring:
- No accidental public exposure
- Compliance with Zero Trust and least-privilege storage models

---

### ❌ Unauthorized Access Denied
![S3 Access Denied](screenshots/S3-console-access-denied.png)

This access denial is **intentional and expected behavior**.

The CloudTrail logging bucket policy:
- Explicitly denies access from unauthorized principals
- Allows access only from the CloudTrail service and approved IAM roles
- Prevents administrators and users from casually browsing or modifying security logs

This design ensures:
- **Log integrity**
- **Non-repudiation**
- **Tamper resistance**, which is critical for incident response and audits

---

## 📜 Logging & Monitoring

### 📘 CloudTrail Configuration
![CloudTrail Configuration](screenshots/cloudtrail-configuration.png)

CloudTrail is enabled to capture:
- API calls
- IAM activity
- Security-relevant events across the account

Logs are centrally stored and protected to support investigations and compliance.

---

### 📊 CloudWatch Logs
![CloudWatch Logs](screenshots/cloudwatch-log.png)

CloudWatch provides:
- Centralized log aggregation
- Operational visibility
- The foundation for alerting and incident response workflows

---

## ⚠️ Challenges & Issues Encountered

### 1️⃣ CloudTrail Bucket Access Denied
**Issue:**  
Initial attempts to view CloudTrail logs from the console resulted in access denied errors.

**Resolution:**  
This behavior was validated as correct after reviewing the bucket policy. The policy intentionally restricts access to:
- The CloudTrail service
- Explicitly approved IAM roles

This reinforces Zero Trust by preventing unnecessary human access to audit logs.

---

### 2️⃣ Terraform Permission Errors
**Issue:**  
Terraform initially failed when applying S3 bucket policies and IAM resources due to insufficient permissions.

**Resolution:**  
IAM policies were refined to include only the required actions for:
- `s3:GetBucketPolicy`
- `iam:PassRole`
- `cloudtrail:*` (scoped appropriately)

This reinforced the importance of **iterative least-privilege policy design**.

---

### 3️⃣ Private Resource Connectivity
**Issue:**  
AWS services were unreachable from private subnets without internet access.

**Resolution:**  
VPC endpoints were implemented for required services (such as S3), allowing:
- Secure private connectivity
- Removal of unnecessary internet gateways
- Alignment with Zero Trust networking principles

---

## 🧠 Zero Trust Principles Demonstrated
- Identity-first access control
- Least privilege enforcement
- No public infrastructure exposure
- Centralized, tamper-resistant logging
- Infrastructure as Code
- Defense-in-depth
- Cost-aware and auditable cloud design

---

## 📎 Notes
This project was built as a **portfolio-grade cloud security lab** to demonstrate hands-on understanding of:
- Zero Trust architecture
- AWS IAM and logging services
- Secure cloud networking
- Real-world troubleshooting and security validation
