docker run --name mysql \
    -v mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=9660527 \
    -e MYSQL_USER=docker \
    -e MYSQL_PASSWORD=9660527 \
    -p 3306:3306 -d mysql
