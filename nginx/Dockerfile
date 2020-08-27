FROM nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=NO/ST=Oslo/L=Oslo/O=Dis/CN=localhost"
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /data/cache
EXPOSE 80 443
