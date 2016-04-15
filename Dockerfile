FROM wordpress:latest
MAINTAINER Qun Wang <tshwangq@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip wget vsftpd db5.3-util \
    && wget https://downloads.wordpress.org/plugin/rest-api.2.0-beta13.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip \
    && rm -rf /var/lib/apt/lists/*

# Download WordPress CLI
RUN curl -L "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" > /usr/bin/wp && \b    chmod +x /usr/bin/wp

VOLUME ["/var/www/html"]
