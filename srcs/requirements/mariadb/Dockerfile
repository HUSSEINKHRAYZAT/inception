FROM debian:bookworm

# Install MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*
RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy setup script
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

# Expose port (optional, for debugging)
EXPOSE 3306

# Run the MariaDB setup script
CMD ["bash", "/init.sh"]
