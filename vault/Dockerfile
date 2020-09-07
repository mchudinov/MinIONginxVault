FROM vault
RUN apk add -U --no-cache openssl
RUN mkdir -p /vault/config
COPY vault.json /vault/config/vault.json

EXPOSE 8201