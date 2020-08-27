# FROM alpine
# RUN apk --no-cache add openssl

FROM vault
RUN mkdir -p /vault/config
COPY vault.json /vault/config/vault.json
EXPOSE 8200