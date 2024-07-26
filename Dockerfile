# Use the official Golang image as a build stage
FROM golang:1.20-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum to the working directory
COPY go.mod go.sum ./

# Download all dependencies
RUN go mod download

# Copy the source code to the working directory
COPY . .

# Build the Go application
RUN go build -o main .

# Use a minimal image for the final stage
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Copy the built Go application from the builder stage
COPY --from=builder /app/main .
COPY --from=builder /app/static ./static

# Expose port 8080
EXPOSE 8080

# Command to run the Go application
CMD ["./main"]
