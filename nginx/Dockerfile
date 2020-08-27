FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY localhost.crt /etc/ssl/certs/localhost.crt
COPY localhost.key /etc/ssl/certs/localhost.key
RUN mkdir -p /data/cache
EXPOSE 80 443
