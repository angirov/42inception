FROM debian:bullseye

RUN apt update \
    && apt install -y nginx

COPY requirements/cert/server.key    /etc/ssl/private/server.key
COPY requirements/cert/server.pem    /etc/ssl/certs/server.pem
COPY requirements/cert/ca.pem        /etc/ssl/certs/ca.pem
RUN sed -i -e "s/TLSv1 //" -e "s/TLSv1.1 //" /etc/nginx/nginx.conf

COPY requirements/nginx/conf/default.conf /etc/nginx/conf.d/efault.conf

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]