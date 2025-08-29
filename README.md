# aws-devops-e2e-project

A hands-on DevOps pipeline project: Node.js app, AWS infrastructure via Terraform, Docker containerization, automated CI/CD, and monitoring with CloudWatch.

## Table of Contents
- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Infrastructure Setup](#infrastructure-setup)
- [CI/CD Pipeline](#cicd-pipeline)
- [Monitoring](#monitoring)
- [Artifact Management](#artifact-management)
- [Folder Structure](#folder-structure)
- [License](#license)

---

## Project Overview

This project demonstrates an end-to-end DevOps workflow:
- Node.js sample app deployed on AWS
- Infrastructure provisioned with Terraform (need to add later that I can't use data sources properly because I don't want to risk using non-free-tier resources)
- CI/CD pipeline using Jenkins, AWS CodePipeline, or GitHub Actions
- Docker containerization
- Monitoring with AWS CloudWatch

---

## Architecture

![Architecture Diagram](docs/architecture.png)

*Briefly describe your architecture here (e.g., EC2 hosts Jenkins, S3 for artifacts, ECR for images, etc.).*

---

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/aws-devops-e2e-project.git
   cd aws-devops-e2e-project