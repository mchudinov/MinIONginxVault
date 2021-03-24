FROM hashicorp/vault
RUN apk add -U --no-cache nano
RUN mkdir -p /vault/config
COPY vault.json /vault/config/vault.json
COPY kes-policy.hcl /tmp/kes-policy.hcl

EXPOSE 8201