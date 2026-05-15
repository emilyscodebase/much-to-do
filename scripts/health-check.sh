#!/bin/bash
echo "Running health checks..."

# Check backend health
HEALTH=$(curl -s -o /dev/null -w "%{http_code}" 
http://$ALB_DNS_NAME/health)

if [ $HEALTH -eq 200 ]; then
  echo "Backend health check passed!"
else
  echo "Backend health check failed with status: $HEALTH"
  exit 1
fi

echo "All health checks passed!"
