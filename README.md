# Prepare

The "official" preparation requires running this:

```
docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null
```

# Build

run `make` from the project root directory. Tested both for macOS's docker desktop and Linux.

There must be an `.env` with environent variables containing credentials, 
which are set during deployment. 
For example, you might execute in the project root directory:

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

## Cleanup

run `make clean` on mac or `sudo make clean` on Linux.

# Security

Check TLS:

```
openssl s_client -connect vangirov.42.fr:443 -tls1_1

openssl s_client -connect vangirov.42.fr:443 -tls1_2
```

# Logging in

To login as an user/admin `https://vangirov.42.fr/wp-login.php`
