FROM debian:bookworm

# Install PHP, MariaDB client, and tools
RUN apt-get update && \
    apt-get install -y php8.2 php8.2-fpm php8.2-mysql mariadb-client wget unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM to listen on TCP port 9000
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf


# Create WordPress folder and install WordPress
RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* /var/www/html && \
    rm -rf wordpress latest.tar.gz

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copy and prepare setup script
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["bash", "/setup.sh"]
