# System Architecture

## Overview
StartTech uses a modern cloud-native architecture on AWS.

## Components

### Frontend
- React application built with Vite
- Hosted on AWS S3
- Served globally via CloudFront CDN

### Backend
- Golang REST API
- Runs on EC2 instances behind Application Load Balancer
- Auto Scaling Group manages 1-4 instances
- Docker containers pulled from ECR

### Database
- MongoDB Atlas for data persistence
- Managed cloud database

### Networking
- VPC with public and private subnets
- Internet Gateway for public access
- Security Groups for ALB and EC2

### Monitoring
- CloudWatch Log Groups for centralized logging
- CloudWatch Dashboard for metrics
- CloudWatch Alarms for high CPU alerts

## CI/CD Flow
1. Developer pushes code to GitHub
2. GitHub Actions workflow triggers
3. Tests and security scans run
4. Docker image built and pushed to ECR
5. EC2 instances updated via Auto Scaling refresh
6. Health checks verify deployment

## Security
- IAM roles with least privilege
- Secrets stored in GitHub Secrets
- Security groups restrict traffic
- Non-root Docker containers
