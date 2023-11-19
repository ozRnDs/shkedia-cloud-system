FROM nginx:latest

COPY nginx_config/server.conf /etc/nginx/nginx.conf

COPY certificates/16.171.165.242.crt /etc/ssl/certs/16.171.165.242.crt
COPY certificates/16.171.165.242.key /etc/ssl/private/16.171.165.242.key
COPY nginx_files/. /var/example/