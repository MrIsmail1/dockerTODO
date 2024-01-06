FROM alpine:latest

# Installation des dépendances nécessaires pour Composer
RUN apk --no-cache add \
    php \
    php-phar \
    php-openssl \
    php-json \
    php-iconv \
    php-tokenizer \
    php-xml \
    php-curl \
    php-mbstring

# Créer un répertoire pour Composer
RUN mkdir -p /var/www/html/composer

# Copier le fichier composer.json depuis le répertoire local vers le conteneur
COPY ./composer.json /var/www/html/composer/composer.json

# Téléchargement et installation de Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Exposer le répertoire où Composer stockera les packages
VOLUME [ "/app" ]

# Définir le répertoire de travail
WORKDIR /var/www/html/composer

# Exécuter Composer à chaque démarrage par défaut
CMD ["composer", "install"]