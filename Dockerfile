# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcadogan <lcadogan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/19 12:45:05 by lcadogan          #+#    #+#              #
#    Updated: 2021/02/19 17:56:57 by lcadogan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# Update Software Packages
RUN apt-get update
RUN apt-get upgrade -y

# Install tools
RUN apt-get -y install wget

# Install Nginx Web server
RUN apt-get -y install nginx

# Install MYSQL
RUN apt-get -y install mariadb-server

# INSTALL PHP
RUN apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring