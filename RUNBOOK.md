# Operations Runbook

## Health Checks

### Check Application Health
```bash
curl http://starttech-alb-238457354.us-east-1.elb.amazonaws.com/health
```

### Check EC2 Instances
```bash
aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names starttech-asg
```

### Check CloudWatch Logs
```bash
aws logs tail /starttech/starttech/backend --follow
```

## Deployment

### Deploy Frontend
```bash
./scripts/deploy-frontend.sh
```

### Deploy Backend
```bash
./scripts/deploy-backend.sh
```

## Rollback

### Rollback Backend
```bash
./scripts/rollback.sh
```

### Rollback Frontend
```bash
aws s3 sync s3://starttech-frontend-rclm8np2-backup/ s3://starttech-frontend-rclm8np2/
aws cloudfront create-invalidation --distribution-id E2T35WOXL7M6UY --paths /*
```

## Troubleshooting

### Application Not Responding
1. Check EC2 instance health in AWS console
2. Check CloudWatch logs for errors
3. Verify MongoDB Atlas connection
4. Check security group rules

### Pipeline Failing
1. Check GitHub Actions logs
2. Verify AWS secrets are correct
3. Check ECR repository exists
4. Verify IAM permissions

### High CPU Alert
1. Check CloudWatch metrics
2. Review application logs
3. Scale up ASG if needed
```bash
aws autoscaling set-desired-capacity --auto-scaling-group-name starttech-asg --desired-capacity 4
```
