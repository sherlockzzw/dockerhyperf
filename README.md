
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

 hyperf-auth
## 支持的验证方式

* session
* jwt
* sso （单点登录，继承自jwt，需要 hyperf/redis，支持多客户端）

发布配置 vendor:publish
```bash
php bin/hyperf.php vendor:publish 96qbhy/hyperf-auth
```

生成 `.env` 配置项
```bash
php bin/hyperf.php gen:auth-env
```
https://github.com/qbhy/hyperf-auth


```[ERROR] Error: Call to undefined function Qbhy\HyperfAuth\env() in /var/www/hyperf-skeleton/vendor/96qbhy/hyperf-auth/src/AuthCommand.php:34
Stack trace:

找到 AuthCommand类 use function Hyperf\Support\env;即可


``` composer常用包安装
composer require hyperf/validation
composer require hyperf/swagger

``` 发布配置
php bin/hyperf.php vendor:publish hyperf/swagger
