FROM php:8.2-apache

# Install database extensions needed for Adminer
RUN docker-php-ext-install mysqli pdo_mysql

# Copy your forked Adminer files to the Apache web directory
COPY . /var/www/html/

# Expose the default Apache port
EXPOSE 80
