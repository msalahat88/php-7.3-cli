FROM php:7.3-cli

RUN apt-get update -yy && \
    apt-get upgrade -yy && \
    apt-get install -yy --no-install-recommends \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    cron \
    libicu-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    libmagickwand-dev \
    zlib1g-dev \
    libzip-dev \
    libpng-dev \
    && pecl install imagick \
    zip \
    xpdf \
    libmagickwand-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -yy && \
        apt-get upgrade -yy && \
        apt-get install -yy --no-install-recommends \
        imagemagick

RUN docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-configure intl --enable-intl && \
    pecl install mongodb && \
    docker-php-ext-enable zip && \
    docker-php-ext-install exif && \
    docker-php-ext-install gd && \
    docker-php-ext-install intl && \
    docker-php-ext-enable mongodb

RUN apt-get update -yy && \
        apt-get upgrade -yy && \
        apt-get install -yy --no-install-recommends \
        imagemagick

RUN docker-php-ext-enable imagick

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
