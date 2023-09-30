https://vangirov.42.fr/wp-login.php


There must be an `.env` with environent variables containing credentials, 
which are set during deployment. For example:

```
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

```