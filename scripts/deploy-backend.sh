#!/bin/bash
echo "Deploying backend to EC2..."
cd Server/MuchToDo

# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username 
AWS --password-stdin $ECR_REPOSITORY_URL

# Build and push Docker image
docker build -t $ECR_REPOSITORY_URL:latest .
docker push $ECR_REPOSITORY_URL:latest

# Trigger rolling update
aws autoscaling start-instance-refresh \
  --auto-scaling-group-name starttech-asg \
  --preferences MinHealthyPercentage=50

echo "Backend deployed successfully!"
