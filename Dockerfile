FROM php:8.2-fpm

WORKDIR /var/www

# 更新软件包列表并安装常用依赖
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 安装 Hyperf 框架所需的扩展
RUN docker-php-ext-install bcmath pdo_mysql opcache

# 安装 Swoole 扩展
RUN pecl install swoole && docker-php-ext-enable swoole

# 安装 Redis 扩展
RUN pecl install redis && docker-php-ext-enable redis

# 安装 sockets 扩展
RUN docker-php-ext-install sockets

RUN docker-php-ext-install pcntl

# 清理不需要的文件和缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 暴露 9501 端口（如果需要）
EXPOSE 9501
