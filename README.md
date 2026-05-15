# StartTech Application

## Overview
Full-stack application with React frontend and Golang backend, deployed on AWS using CI/CD pipelines.

## Architecture
- Frontend: React app deployed to S3 with CloudFront CDN
- Backend: Golang API deployed to EC2 with Auto Scaling
- Database: MongoDB Atlas
- Infrastructure: Managed with Terraform

## CI/CD Pipelines

### Frontend Pipeline
Triggered when changes are pushed to Client/ folder.

### Backend Pipeline
Triggered when changes are pushed to Server/ folder.

## Deployment

### Frontend
```bash
./scripts/deploy-frontend.sh
```

### Backend
```bash
./scripts/deploy-backend.sh
```

### Health Check
```bash
./scripts/health-check.sh
```

### Rollback
```bash
./scripts/rollback.sh
```
