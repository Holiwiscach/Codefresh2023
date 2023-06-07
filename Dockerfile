FROM ubuntu:latest

RUN apt-get update
ENV TZ=America/Mexico_City \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get install \
apache2 \
php8.1 \
libapache2-mod-php8.1 \
php8.1-mysql -y --no-install-recommends

WORKDIR /var/www/html/

COPY ./my-app /var/www/html/
RUN rm /var/www/html/index.html

ADD https://gitlab.com/amgdark/frameworks2023/-/blob/master/requirements.txt /tmp/

ENV NOMBRE=Luis

EXPOSE 80

CMD ["apachectl","-DFOREGROUND"]