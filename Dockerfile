# Image de base
FROM ubuntu:16.04
#Installation d'apache
RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php php-mysql gettext-base
RUN a2enmod php7.0
# Add wordpress files
ADD wordpress/ /var/www/html/wordpress
RUN a2enmod php7.0
RUN chmod 0777 /var/www/html/wordpress
ADD wp-config.php-template /var/www/html/wordpress
ADD entrypoint.sh /
# Identifie quelle commande rouler
ENTRYPOINT  ["/bin/bash","/entrypoint.sh"]
EXPOSE 80