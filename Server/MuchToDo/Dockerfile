# ---- Stage 1: Builder ----
FROM golang:1.25-alpine AS builder

# Install dependencies
RUN apk add --no-cache git

# Install swag for generating docs
RUN go install github.com/swaggo/swag/cmd/swag@latest

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum first (for caching)
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the code
COPY . .

# Generate swagger docs
RUN swag init -g cmd/api/main.go

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/api/main.go

# ---- Stage 2: Runner ----
FROM alpine:latest

# Create non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy binary from builder stage
COPY --from=builder /app/main .
COPY --from=builder /app/.env .

# Use non-root user
USER appuser

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:8080/health || exit 1

# Run the app
CMD ["./main"]
