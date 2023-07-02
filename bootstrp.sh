docker-compose down -v\
&& docker volume rm es-data kibana-data certs es-plugins; \
docker volume create es-data \
&& docker volume create kibana-data \
&& docker volume create certs \
&& docker volume create es-plugins \
&& docker-compose  up -d

