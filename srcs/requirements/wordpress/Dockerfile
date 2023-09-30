FROM debian:bullseye

RUN apt-get update && apt-get install -y php-fpm=2:7.4+76 php-mysql wget mariadb-client


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
	chmod +x /usr/local/bin/wp

COPY conf/php-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY tools/wordpress-setup.sh /
RUN chmod +x /wordpress-setup.sh

WORKDIR /var/www/html

CMD ["/wordpress-setup.sh"]