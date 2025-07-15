
---

```markdown
# 🚀 Build a Custom AWS VPC Network

This project is a hands-on deep dive into AWS VPC networking. You'll provision a fully functional custom VPC with public/private subnets, routing, security controls, and EC2 instances—gaining foundational infrastructure skills along the way.

---

## 🎯 Project Overview

You'll build a VPC setup with the following components:

- ✅ Public and private subnets
- ✅ Internet Gateway (IGW)
- ✅ NAT Gateway (EIP-based)
- ✅ Public and private route tables
- ✅ EC2 instances in each subnet
- ✅ Security Groups and Network ACLs

---

## 📐 Architecture Diagram

```

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

```

---

## 🛠️ Tools

You can implement this infrastructure using:

- **Terraform** – Infrastructure as Code (IaC)
- **AWS Console** – Manual UI-based provisioning
- ✅ Optional: Try both and compare the experience

---

## 📌 Tasks Breakdown

### Phase 1: Networking Setup

1. **Create a VPC**
   - CIDR: `10.0.0.0/16`
   - Enable DNS hostnames

2. **Create Subnets**
   - Public Subnet: `10.0.1.0/24` (us-east-1a)
   - Private Subnet: `10.0.2.0/24` (us-east-1a)

3. **Internet Gateway**
   - Create and attach it to the VPC

4. **Route Tables**
   - Public Route Table → IGW
   - Private Route Table → NAT Gateway

5. **NAT Gateway**
   - Allocate an Elastic IP
   - Launch in the public subnet

---

### Phase 2: EC2 Deployment

6. **Launch EC2 Instances**
   - Public EC2 (Web): Amazon Linux, open to SSH/HTTP
   - Private EC2 (DB): Amazon Linux, no direct internet

7. **Configure Security Groups**
   - Web SG: Allow SSH/HTTP from your IP
   - DB SG: Allow inbound traffic only from Web SG

---

### ✅ Connectivity Tests

- SSH into the public EC2 instance
- From there, SSH into the private EC2
- Verify outbound access (e.g., `curl google.com`) from the private instance through the NAT Gateway

---

## ⚡ Optional Enhancements

Take it further with:

- ✅ Multiple Availability Zones for high availability
- ✅ Bastion Host or jumpbox for secure access
- ✅ Network ACLs for subnet-level traffic control
- ✅ S3 VPC Endpoint for private access to S3

---

## 📚 Learning Outcomes

By completing this project, you'll understand:

- VPC design and subnet architecture
- Routing logic: IGW vs NAT
- Secure communication between EC2 tiers
- IAM roles, SGs, and NACLs
- Provisioning via Terraform or AWS Console

---

## 🚀 What's Next?

Choose your deployment style:

1. **Terraform**
2. **AWS Console**
3. **Both (Hybrid or comparison)**

Let me know, and I’ll walk you through your preferred approach step-by-step!
```

---