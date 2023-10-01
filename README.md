# Introduction

In this project aims at learning docker and docker-compose.

The main restrictions of the project:

1. only allowed to pull Alpine/Debian images from the registry, anything else has to be self-built

2. self-signed TLS serftificates of versions 1.2 / 1.3

3. data is stored via volume [bind mounts](https://docs.docker.com/storage/bind-mounts/)

4. very peculiar derictory structure is prescribed:
```
.
├── Makefile
└── srcs/
    ├── docker-compose.yaml
    └── requirements/
        ├── cert/
        ├── mariadb/
        │   ├── conf/
        │   └── tools/
        ├── nginx/
        │   └── conf/
        └── wordpress/
            ├── conf/
            └── tools/
```

# How to ...

## Prepare

The "official" preparation requires running this:

```
docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null
```

## Build

run `make` from the project root directory.

There must be an `.env` with environent variables containing credentials, 
which are set during deployment. 
For example, you might execute the following in the project root directory:

```
cat >srcs/.env <<EOF
# MYSQL SETUP
MYSQL_ROOT_PASSWORD=supersecret
MYSQL_USER=vangirov
MYSQL_PASSWORD=supersecret

# WORDPRESS SETUP PAGE
WP_ADMIN_USER=boss
WP_ADMIN_PASSWORD=supersecret
WP_ADMIN_EMAIL=boss@example.com

WP_USER=justuser
WP_USER_PASSWORD=supersecret
WP_USER_EMAIL=justuser@example.com
EOF
```

## Security

Check TLS:

```
openssl s_client -connect vangirov.42.fr:443 -tls1_1

openssl s_client -connect vangirov.42.fr:443 -tls1_2
```

## Logging in

For Wordpress login go to `https://vangirov.42.fr/wp-login.php`
