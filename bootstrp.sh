docker-compose down -v\
&& docker volume rm e-data k-data certs e-plugins; \
docker volume create e-data \
&& docker volume create k-data \
&& docker volume create certs \
&& docker volume create e-plugins \
&& docker-compose  up -d

