
## dockerhyperf

> 基于 `hyperf` 的开发或布署环境


#### 构建容器

```shell
$ git clone https://github.com/gitupzzw/dockerhyperf.git 

$ cd hyperfConfig

$ sudo docker-compose up -d --build

> 注意： 配置
APP_NAME=skeleton
APP_ENV=dev

DB_DRIVER=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=hyperf
DB_USERNAME=hyperf_guest
DB_PASSWORD=hyperf_guest_password
DB_CHARSET=utf8mb4
DB_COLLATION=utf8mb4_unicode_ci
DB_PREFIX=

REDIS_HOST=redis
REDIS_AUTH=(null)
REDIS_PORT=6379
REDIS_DB=0

