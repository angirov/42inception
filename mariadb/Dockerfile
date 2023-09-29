FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/ /etc/mysql/mariadb.conf.d/

COPY tools/db_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/db_setup.sh

EXPOSE 3306

CMD ["/usr/local/bin/db_setup.sh"]
