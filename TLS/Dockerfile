FROM nginx:latest

COPY server.conf /etc/nginx/nginx.conf

COPY 16.171.165.242.crt /etc/ssl/certs/16.171.165.242.crt
COPY 16.171.165.242.key /etc/ssl/private/16.171.165.242.key
COPY nginx_test/. /var/example/