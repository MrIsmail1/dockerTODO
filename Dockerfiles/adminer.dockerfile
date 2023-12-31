# Use the Alpine Linux base image
FROM alpine:latest

RUN apk add --no-cache php php-session php-pdo php-pdo_mysql php-json php-openssl curl

# Create a directory for Adminer
RUN mkdir -p /var/www/html/adminer

# Download and install Adminer
RUN curl https://www.adminer.org/static/download/4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/index.php

# Expose port 8080 for web access
EXPOSE 8080

# Set the working directory
WORKDIR /var/www/html/adminer

# Command to run Adminer using PHP's built-in server when the container starts
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/adminer/"]
