FROM golang:1.21.5-alpine3.19  AS builder
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN go build -o ./dist/app .
FROM alpine:3.19

WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app/dist/app .

# Set the entry point for the final image
CMD ["./app"]
