# MinIO with KES and HashiCorp Vault in Docker Compose

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

Test MinIO

`mc ls minio --insecure`

## Watch KES logs
Login to KES container shell:

` docker exec -it kes sh`

Trace KES logs

`kes log trace`
