FROM nginx:stable
COPY nginx.conf /etc/nginx/nginx.conf
COPY marcopoloproject /var/www/marcopoloproject
