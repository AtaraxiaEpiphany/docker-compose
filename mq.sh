docker run --hostname=rabbitmq --name rabbitmq \
    --env=RABBITMQ_DEFAULT_PASS=9660527 \
    --env=RABBITMQ_DEFAULT_USER=root  \
    --volume=mq-data:/var/lib/rabbitmq \
    --volume=mq-conf:/etc/rabbitmq  \
    -p 15672:15672 -p 5672:5672  -d rabbitmq:management
