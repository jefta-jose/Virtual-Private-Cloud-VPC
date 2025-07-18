
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

### 🔹 Yes, the **network part** uses the first 16 bits in a `/16` — like `10.0`.

But when we say **“network address”** and **“broadcast address”**, we’re talking about **specific IPs** inside that `/16` range that are **reserved** and **can’t be assigned to devices**.

Let’s break it down.

---

## 🔸 In any subnet (like `/16`):

There are **3 special IPs** you should know:

| Name                  | Example in `10.0.0.0/16`     | Use                                                   |
| --------------------- | ---------------------------- | ----------------------------------------------------- |
| **Network address**   | `10.0.0.0`                   | Represents the whole subnet (like a label)            |
| **Broadcast address** | `10.0.255.255`               | Used to send a message to **all hosts** in the subnet |
| **Usable IPs**        | `10.0.0.1` to `10.0.255.254` | These go to your servers/devices                      |

   10.0.0.0/16
   [10].[0].[0].[0]
   ↑    ↑   ↑   ↑
   |    |   |   └─ 4th octet → host
   |    |   └───── 3rd octet → host
   |    └───────── 2nd octet → network (locked by /16)
   └────────────── 1st octet → network (locked by /16)

Each number in an IP address (like the 10, 0, or 255) is called an octet. Why?

Because each one is 8 bits — and 8 bits can only count up to 255.

2*8 = 256
so the range here is from 0 to 255 which gives us 256 numbers

---

### 🔹 Visualization of `10.0.0.0/16`

```
Subnet: 10.0.0.0/16
Range:  10.0.0.0  →  10.0.255.255

10.0.0.0       = Network address
10.0.255.255   = Broadcast address
10.0.0.1       = First usable host IP
10.0.255.254   = Last usable host IP
```

---

### 🔸 Why do we need a broadcast IP?

The **broadcast IP** is used when a device wants to say:

> "Hey! I need to send a message to *everyone* in the subnet."

Instead of sending it one by one, it sends to the **broadcast address**.

---

### ✅ So to sum it up:

* `/16` means the **first 16 bits are for the network**
* But inside that subnet:

  * One IP (`10.0.0.0`) is reserved to **represent the whole network**
  * One IP (`10.0.255.255`) is reserved to **broadcast to all devices**
  * So only **65,534** IPs are **usable**

---

Ah! I now fully understand your question — you're asking:

> If the **subnet** is `/24` (first 24 bits = network) and the **VPC** is `/16` (first 16 bits = network), doesn't that mean the **subnet has more bits for network** and is therefore *bigger*?

✅ **You're right that `/24` has more network bits**, but here's the twist:

---

### 🔁 CIDR Logic — **More Bits = Smaller Network**

| CIDR  | Network Bits | Host Bits | Total IPs  |
| ----- | ------------ | --------- | ---------- |
| `/16` | 16           | 16        | 65,536 IPs |
| `/24` | 24           | 8         | 256 IPs    |

* A **larger CIDR prefix** (like `/24`) means **fewer host bits**, so **fewer IPs**, so a **smaller block**.
* Think of it like this: you’re *reserving* more bits for identifying networks, which leaves **less room** for hosts.

---

### 🧠 Analogy

Imagine the VPC is a **city (10.0.0.0/16)** and each subnet is a **neighborhood (/24)**:

* The city has **lots of addresses** (65k).
* A neighborhood takes up **only a small part** of the city (256 addresses).
* Even though the subnet has "more bits" for network, it's just describing a **smaller area** more precisely.

---

### ✅ Summary

| CIDR Block | "More Network Bits" | Means...        | Result            |
| ---------- | ------------------- | --------------- | ----------------- |
| `/16`      | 16 network bits     | More host space | **Larger range**  |
| `/24`      | 24 network bits     | Less host space | **Smaller range** |

So, no — the subnet isn’t bigger than the VPC. It’s **smaller**, even though it *uses more bits for the network*. That's how CIDR works!

---