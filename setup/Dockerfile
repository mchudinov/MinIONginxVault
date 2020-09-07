FROM alpine
RUN wget https://github.com/minio/kes/releases/latest/download/kes-linux-amd64 -O /bin/kes
RUN chmod +x /bin/kes
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /bin/mc
RUN chmod +x /bin/mc 
RUN apk add -U --no-cache ca-certificates
RUN apk add -U --no-cache openssl
RUN apk add -U --no-cache curl
