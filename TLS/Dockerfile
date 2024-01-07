FROM nginx:latest

COPY .local/nginx_config/server.conf /etc/nginx/nginx.conf


COPY .local/nginx_config/cert/. /etc/ssl/certs/.
COPY .local/nginx_config/private/. /etc/ssl/private/.

COPY static/. /var/static/
COPY nginx_files/. /var/example/