# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcadogan <lcadogan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/19 12:45:05 by lcadogan          #+#    #+#              #
#    Updated: 2021/02/21 17:23:07 by lcadogan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM 	debian:buster

RUN 	apt-get update && apt-get upgrade -y && \
		apt-get -y install wget && apt-get -y install vim &&\
		apt-get -y install nginx && \
		apt-get -y install mariadb-server && \
		apt-get -y install php7.3 php-mysql php-fpm 

RUN		wget https://wordpress.org/latest.tar.gz 
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		tar -xvf latest.tar.gz
RUN		mv wordpress /var/www/html/
RUN		tar -xvf  phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		rm latest.tar.gz
RUN		rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.4-all-languages phpmyadmin
RUN		mv phpmyadmin /var/www/html/
COPY	/srcs/default etc/nginx/sites-available/default
COPY	/srcs/server_configuration.sh .
RUN		rm /var/www/html/wordpress/wp-config-sample.php
COPY	/srcs/wp-config.php /var/www/html/wordpress
EXPOSE	80 443
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lcadogan.key \
		-out /etc/ssl/lcadogan.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lcadogan"
CMD		bash server_configuration.sh
