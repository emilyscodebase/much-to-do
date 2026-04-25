# MuchToDo API - Container Assessment

## Overview
This project containerizes the MuchToDo Golang API using Docker and deploys it to a local 
Kubernetes cluster using Kind.

## Prerequisites
- Docker Desktop
- Kind
- kubectl

## Project Structure

container-assessment/
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── kubernetes/
│   ├── namespace.yaml
│   ├── mongodb/
│   │   ├── mongodb-secret.yaml
│   │   ├── mongodb-configmap.yaml
│   │   ├── mongodb-pvc.yaml
│   │   ├── mongodb-deployment.yaml
│   │   └── mongodb-service.yaml
│   ├── backend/
│   │   ├── backend-secret.yaml
│   │   ├── backend-configmap.yaml
│   │   ├── backend-deployment.yaml
│   │   └── backend-service.yaml
│   └── ingress.yaml
├── scripts/
│   ├── docker-build.sh
│   ├── docker-run.sh
│   ├── k8s-deploy.sh
│   └── k8s-cleanup.sh
└── README

## Phase 1: Docker Setup

### Build the Docker image
```bash
./scripts/docker-build.sh
```

### Run with Docker Compose
```bash
./scripts/docker-run.sh
```

### Test the application
```bash
curl http://localhost:8080/health
```

## Phase 2: Kubernetes Deployment

### Create Kind cluster
```bash
kind create cluster --name muchtodo-cluster
```

### Load image into Kind
```bash
kind load docker-image muchtodo-backend:latest --name muchtodo-cluster
```

### Deploy to Kubernetes
```bash
./scripts/k8s-deploy.sh
```

### Access the application
```bash
kubectl port-forward service/backend 8081:8080 -n muchtodo
curl http://localhost:8081/health
```

### Cleanup
```bash
./scripts/k8s-cleanup.sh
```
