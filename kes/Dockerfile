FROM alpine
RUN wget https://github.com/minio/kes/releases/latest/download/kes-linux-amd64 -O /bin/kes
RUN chmod +x /bin/kes
RUN apk add -U --no-cache ca-certificates
RUN apk --no-cache add openssl
RUN mkdir /etc/kes
COPY kes-server.yml /etc/kes

EXPOSE 7373
