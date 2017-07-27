FROM php:5.6-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
        libcurl4-openssl-dev \
        libxml2 \
        libxml2-dev \
        pkg-config \
        libssl-dev \
        imagemagick \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd iconv mcrypt pdo pdo_mysql opcache intl curl dom gettext json mbstring pcntl posix session simplexml soap zip \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable gd iconv mcrypt pdo pdo_mysql opcache intl curl dom gettext json mbstring pcntl posix session simplexml soap \
    && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -o composer https://getcomposer.org/composer.phar && \
    chmod +x ./composer && \
    cp ./composer /usr/local/bin/ && \
    rm ./composer

COPY php.ini /usr/local/etc/php/
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 9000

WORKDIR /var/www/html
CMD ["/entrypoint.sh"]
