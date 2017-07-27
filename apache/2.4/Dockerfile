FROM httpd:2.4

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        mysql-client \
        curl && \
    rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ADD substitute-env-vars.sh /substitute-env-vars.sh
RUN chmod 755 /substitute-env-vars.sh
ADD httpd.conf /usr/local/apache2/conf/httpd.conf

EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html
CMD ["/entrypoint.sh"]
