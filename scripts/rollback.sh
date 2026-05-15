#!/bin/bash
echo "Rolling back deployment..."

# Rollback Auto Scaling Group to previous version
aws autoscaling start-instance-refresh \
  --auto-scaling-group-name starttech-asg \
  --preferences MinHealthyPercentage=50,CheckpointDelay=60

echo "Rollback initiated successfully!"
