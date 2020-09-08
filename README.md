# MinIO with KES and HashiCorp Vault in Docker Compose

## MinIO documentation reference
https://github.com/minio/kes/wiki/Hashicorp-Vault-Keystore


## Infrastructure

```
                                    ┌────────────┐
                                  ┌─┤   MinIO 1  ├─┐
                                  │ └────────────┘ │
┌────────────┐    ┌────────────┐  │ ┌────────────┐ │        ┌────────────┐           ┌───────────┐  
│  Browser   ├───>│  Nginx-LB  ├──┼─│   MinIO 2  ├─┼────────┤ KES Server ├───────────┤   Vault   │  
└────────────┘    └────────────┘  │ └────────────┘ │        └────────────┘           └───────────┘  
                                  │ ┌────────────┐ │ 
                                  └─┤   MinIO 3  ├─┘
                                    └────────────┘                           
```

## Prerequsites

- docker-compose installed.

- Visual Studio Code with Docker extension by Microsoft is really helpful.

## Build and start

```sh
docker-compose build
docker-compose up -d
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

`mc mb bucket1 --insecure`

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

Remove related containers

`docker-compose down`

Remove all related images 

`docker rmi -f $(docker images -a -q)`