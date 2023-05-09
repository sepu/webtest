FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \ 
apt update \ 
&& apt upgrade -y \ 
&& apt install apache2 -y

COPY . /var/www/html

CMD apachectl -D FOREGROUND
