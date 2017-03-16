# Testing Slim MVC
# Docker container to install and setup.

# Define image
FROM php:7.0-apache

# Configs
COPY config/apache.conf /etc/apache2/sites-enabled/000-default.conf

# Enable Apache Rewrite Rules
RUN a2enmod rewrite

# Apt Updates
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y zip
RUN apt-get install -y unzip
RUN apt-get install -y vim

# Install Composer and make it available in the PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Switch to our working directory
#WORKDIR /var/www/html

# Make copy of composer json
#COPY config/composer.json ./

# Install dependencies with Composer.
# --prefer-source fixes issues with download limits on Github.
# --no-interaction makes sure composer can run fully automated
#RUN composer install --prefer-source --no-interaction

#COPY . ./
