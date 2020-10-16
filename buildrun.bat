REM windows
docker-compose pull
docker-compose build 

docker-compose up -d

docker-compose down

docker build -t vault .

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf
