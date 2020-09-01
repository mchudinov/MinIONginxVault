FROM alpine
RUN wget https://github.com/minio/kes/releases/latest/download/kes-linux-amd64 -O /bin/kes
RUN chmod +x /bin/kes
RUN apk add -U --no-cache ca-certificates
RUN apk --no-cache add openssl
RUN openssl ecparam -genkey -name prime256v1 | openssl ec -out /etc/ssl/certs/server.key
RUN openssl req -new -x509 -days 30 -key /etc/ssl/certs/server.key -out /etc/ssl/certs/server.cert -subj "/C=/ST=/L=/O=/CN=localhost" -addext "subjectAltName = IP:127.0.0.1"
RUN kes tool identity new --key=root.key --cert=root.cert root

EXPOSE 7373
ENTRYPOINT kes server --key=/etc/ssl/certs/server.key --cert=/etc/ssl/certs/server.cert --root=$(kes tool identity of root.cert) --auth=off




