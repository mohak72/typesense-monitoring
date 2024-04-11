# Use an official lightweight base image, like Alpine
FROM alpine:latest

# Set work directory
WORKDIR /app

# Add metadata to the image to describe that the container is listening on port 9131
EXPOSE 9131

# Install dependencies, if any
RUN apk add --no-cache \
        ca-certificates \
        && update-ca-certificates

# Download and install the Typesense Exporter binary
# Replace `URL_TO_TYPESENSE_EXPORTER_BINARY` with the actual URL
ADD URL_TO_TYPESENSE_EXPORTER_BINARY /app/typesense-exporter

# Make sure the binary is executable
RUN chmod +x /app/typesense-exporter

# Command to run the exporter
# Replace `--typesense-api-key` and `--typesense-host` with actual values or environment variables as needed
CMD ["/app/typesense-exporter", "--typesense-api-key=your_api_key_here", "--typesense-host=your_typesense_host_here"]
