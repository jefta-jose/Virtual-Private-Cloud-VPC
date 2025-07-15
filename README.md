---

```markdown
# 🚀 My Custom Network on AWS

This project is a hands-on dive into AWS VPC networking. You'll learn to build a custom Virtual Private Cloud with both public and private components, security controls, and EC2 instances—all while exploring infrastructure fundamentals.

---

## 🎯 Project Overview

Build a custom AWS VPC with the following resources:

- ✅ Public and private subnets
- ✅ Internet Gateway (IGW)
- ✅ NAT Gateway (EIP-based)
- ✅ Route Tables (public & private)
- ✅ EC2 instances in each subnet
- ✅ Security Groups and NACLs

---

## 📐 Architecture Diagram

```
            ┌─────────────────────────────┐
            │         VPC (10.0.0.0/16)   │
            │                             │
            │   ┌────────────┐            │
            │   │ Public Subnet 1         │
            │   │ (10.0.1.0/24)           │
            │   └────┬───────┘            │
            │        │                    │
       ┌────▼────┐   │              ┌────────────┐
       │Internet │   │              │ NAT Gateway│
       │ Gateway │   │              └────┬───────┘
       └─────────┘   │                   │
                     │                   │
            │   ┌────▼─────┐             │
            │   │ EC2: Web │             │
            │   └──────────┘             │
            │                            │
            │   ┌────────────┐           │
            │   │ Private Subnet 1       │
            │   │ (10.0.2.0/24)          │
            │   └────┬────────┘          │
            │        │                   │
            │   ┌────▼──────┐            │
            │   │ EC2: DB   │◄───────────┘
            │   └───────────┘
            └─────────────────────────────┘
```

---

## 🛠 Tools

You can implement this setup using:

- **Terraform** – for infrastructure as code (IaC)
- **AWS Console** – for visual, manual provisioning
- ✅ Optional: Comparison or hybrid implementation

---

## 📌 Tasks Breakdown

### Phase 1: Networking

1. **Create VPC**
   - CIDR block: `10.0.0.0/16`
   - Enable DNS hostnames

2. **Create Subnets**
   - Public Subnet: `10.0.1.0/24` (us-east-1a)
   - Private Subnet: `10.0.2.0/24` (us-east-1a)

3. **Internet Gateway**
   - Create & attach to VPC

4. **Route Tables**
   - Public RT → IGW
   - Private RT → NAT Gateway

5. **NAT Gateway**
   - Allocate Elastic IP
   - Deploy in Public Subnet

---

### Phase 2: EC2 Deployment

6. **Launch EC2 Instances**
   - Web (Public): Amazon Linux, SSH/HTTP open
   - DB (Private): Amazon Linux, locked-down

7. **Security Groups**
   - Web SG → Allow SSH/HTTP from your IP
   - DB SG → Allow only inbound from Web SG

---

### ✅ Connectivity Testing

- SSH into Public EC2
- From there, SSH into Private EC2
- Ping outbound (e.g., `curl google.com`) from Private instance via NAT

---

## ⚡ Optional Enhancements

- Add Network ACLs
- Use multiple Availability Zones
- Add Bastion Host or jumpbox
- Private S3 access with VPC Endpoint

---

## 📚 Learning Outcomes

By completing this project, you'll gain practical experience with:

- VPC design and subnetting
- NAT vs IGW and routing logic
- EC2 connectivity across tiers
- Basic security practices with SGs and NACLs
- Terraform or AWS Console provisioning

---

## 🚀 Next Steps

Choose your deployment style:

> **1. Terraform**
> **2. AWS Console**
> **3. Both (Hybrid or comparison)**

Let me know and I’ll walk you through it step-by-step!

```

---