# ---- Stage 1: Build the Go application ----
FROM golang:1.22-alpine AS builder
# Set the working directory
WORKDIR /app

# Copy go.mod and go.sum first (for caching modules)
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the files
COPY . .

# Build the Go binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/main .

# ---- Stage 2: Create a minimal image ----
FROM alpine:3.17

# Copy the binary from the builder image
COPY --from=builder /app/main /main

# Expose port 8080 (or whichever port you expect to use)
EXPOSE 8080

# Set the entrypoint to the binary
ENTRYPOINT ["/main"]
