#!/bin/sh

# openssl req -trustout -batch -x509 -nodes -days 7 -newkey rsa:4048 \
#     -keyout /etc/ssl/private/inception-nginx.key \
#     -out /etc/ssl/certs/inception-nginx.crt


# create CA-key and CA-csr
openssl req -new -subj "/CN=inception-ca" -newkey rsa:4096 -nodes -out ${CA_NAME:-ca}.csr -keyout ${CA_NAME:-ca}.key
# self-sing the CA-certificate
openssl x509 -trustout -signkey ${CA_NAME:-ca}.key -days 365 -req -in ${CA_NAME:-ca}.csr -out ${CA_NAME:-ca}.pem
# create server key
openssl genrsa -out ${SERVER_NAME:-server}.key 4096
# create CSR
openssl req -new -config=openssl-csr.conf -key ${SERVER_NAME:-server}.key -out ${SERVER_NAME:-server}.csr
# read CSR
openssl req -in ${SERVER_NAME:-server}.csr -noout -text
# sing CSR
openssl x509 -req -in ${SERVER_NAME:-server}.csr -CA ${CA_NAME:-ca}.pem -CAkey ${CA_NAME:-ca}.key -CAcreateserial -out ${SERVER_NAME:-server}.pem \
    -extfile openssl-csr.conf -extensions req_ext

# cat $CA_NAME.pem ${SERVER_NAME:-server}.pem > bundle_chained.crt;

# https://stackoverflow.com/questions/51899844/nginx-ssl-no-start-line-expecting-trusted-certificate
# https://stackoverflow.com/questions/21297139/how-do-you-sign-a-certificate-signing-request-with-your-certification-authority
# https://stackoverflow.com/questions/30977264/subject-alternative-name-not-present-in-certificate