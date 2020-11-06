# MinIO with KES and HashiCorp Vault in Docker Compose

## Infrastructure

```
                                    ┌────────────┐
                                  ┌─┤   MinIO 1  ├─┐
                                  │ └────────────┘ │
┌────────────┐    ┌────────────┐  │ ┌────────────┐ │        ┌────────────┐        ┌───────────┐  
│  Browser   ├───>│  Nginx-LB  ├──┼─│   MinIO 2  ├─┼────────┤ KES Server ├────────┤   Vault   │  
└────────────┘    └────────────┘  │ └────────────┘ │        └────────────┘        └───────────┘  
                                  │ ┌────────────┐ │ 
                                  └─┤   MinIO 3  ├─┘
                                    └────────────┘                           
```

## MinIO documentation reference
Relevant documentation

https://github.com/minio/kes/wiki/Hashicorp-Vault-Keystore

## Prerequsites

- docker-compose installed.

- Visual Studio Code with Docker extension by Microsoft is quite helpful.

## How to run

1. Build and start Vault

```sh
docker-compose -f docker-compose-vault.yml build
docker-compose -f docker-compose-vault.yml up -d 
docker logs vault
```

2. Catch Vault Root Token from log

` Root Token: s.xPsBBNfiUV09xN84mQK7BZA5`

3. Activate Vault roles and find role_id and secret_id.
```sh
export VAULT_TOKEN=s.xPsBBNfiUV09xN84mQK7BZA5
vault secrets enable kv
vault auth enable approle
vault policy write kes-policy /tmp/kes-policy.hcl
vault write auth/approle/role/kes-role token_num_uses=0  secret_id_num_uses=0  period=5m
vault write auth/approle/role/kes-role policies=kes-policy
vault read auth/approle/role/kes-role/role-id 
vault write -f auth/approle/role/kes-role/secret-id
```
We are interested in the **role_id** and **secret_id**.

4. Edit docker-compose.yml 

` VAULT_TOKEN=s.xPsBBNfiUV09xN84mQK7BZA5`

5. Edit /kes/kes-server.yml
```
id:     "986f8a4a-fa83-bc20-ffd3-14d1973e9ac1" # Your AppRole ID
secret: "255a8056-6d6a-40fd-ad72-3822e0ecac51" # Your AppRole Secret ID
```

6. Build and run MinIO cluster
```sh
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d 
```

## Login to MinIO web-interface

Open a web browser at https://localhost

Login with _minio_ and _minio123_ as password.

## Use MinIO from command line interface

Login to interactive-shell container:

`docker exec -it interactive-shell sh`

Test MinIO connection

`mc ls minio --insecure`

Create a bucket

`mc mb minio/bucket1 --insecure`

Enable encryption for a bucket

`mc encrypt set sse-s3 minio/bucket1/ --insecure`

Check encyption status for a bucket

`mc encrypt info minio/bucket1/ --insecure`

Upload a file to a bucket

`mc cp myfile.txt minio/bucket1/ --insecure`

## Trace KES logs
Login to KES container shell:

`docker exec -it kes sh`

Trace KES logs

`kes log trace`

## Clean up

### Remove related containers

`docker-compose down`

### Remove all related images 

`docker rmi -f $(docker images -a -q)`

This alsow helps with build error: *Max depth excceeded*