FROM php:8.2-apache

# Install PostgreSQL drivers required by Adminer
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Copy everything to the server root
COPY . /var/www/html/

# Explicitly fix Apache permissions to avoid the 403 Forbidden alert
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Point Apache's directory index to look into the nested folder structure
RUN echo "DirectoryIndex adminer/index.php index.php" > /var/www/html/.htaccess

EXPOSE 80
