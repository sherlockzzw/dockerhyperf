FROM shinsenter/hyperf:latest

WORKDIR /var/www/html

RUN sed -i 's/http:\/\/ports.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list

# 更新软件包列表并安装常用依赖
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    php-pear \
    php-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 安装 Hyperf 框架所需的扩展
RUN docker-php-ext-install bcmath pdo_mysql opcache

# 安装 Swoole 扩展
RUN pecl install swoole && docker-php-ext-install swoole

# 安装 Redis 扩展
RUN pecl install redis && docker-php-ext-install redis

# 安装 sockets 扩展
RUN docker-php-ext-install sockets

RUN docker-php-ext-install pcntl

# 清理不需要的文件和缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置时区为Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 指定禁用的函数列表
RUN sed -i '/^disable_functions/c\disable_functions = passthru,exec,system,eval,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen' /usr/local/etc/php/cli/php.ini
# 暴露 9501 swagger默认9500
EXPOSE 9501 9500