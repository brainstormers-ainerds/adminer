FROM php:8.2-apache

# Install PostgreSQL drivers required by Adminer
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Copy everything to the server root
COPY . /var/www/html/

# Ensure Adminer's main script runs as the homepage
# (If your fork uses a different file name like adminer.php, change it below)
RUN echo "DirectoryIndex adminer.php index.php" > /var/www/html/.htaccess

EXPOSE 80
