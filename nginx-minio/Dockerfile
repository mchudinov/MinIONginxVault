FROM nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/nginx-minio.key -out /etc/ssl/certs/nginx-minio.crt -subj '/C=/ST=/L=/O=/CN=localhost'
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /data/cache
EXPOSE 80 443
