#!/bin/bash
echo "Starting all services with Docker Compose..."
docker compose up -d
echo "All services started successfully!"
echo "App running at http://localhost:8080"
