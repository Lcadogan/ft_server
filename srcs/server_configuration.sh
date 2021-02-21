#!/bin/bash
service nginx start
service mysql start
service php7.3-fpm start

mysql -u root --skip-password -e "CREATE DATABASE datasql;"
mysql -u root --skip-password -e "CREATE USER 'lcadogan'@'localhost' IDENTIFIED BY '123';"
mysql -u root --skip-password -e "GRANT ALL ON datasql.* TO 'lcadogan'@'localhost' IDENTIFIED BY '123';" 
mysql -u root --skip-password -e "FLUSH PRIVILEGES;"

bash