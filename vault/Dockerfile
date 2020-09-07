FROM vault
RUN apk --no-cache add openssl
RUN mkdir -p /vault/config
COPY vault.json /vault/config/vault.json

EXPOSE 8201