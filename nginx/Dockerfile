FROM nginx:alpine

COPY cert/server.key    /etc/ssl/private/server.key
COPY cert/server.pem    /etc/ssl/certs/server.pem
COPY cert/ca.pem        /etc/ssl/certs/ca.pem
RUN sed -i -e "s/TLSv1 //" -e "s/TLSv1.1 //" /etc/nginx/nginx.conf

ADD nginx/default.conf /etc/nginx/conf.d/
