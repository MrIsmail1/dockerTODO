FROM alpine:latest

RUN apk add --no-cache postgresql

RUN adduser -D pgsql && \
    mkdir -p /var/lib/postgresql/data && \
    chown -R pgsql:pgsql /var/lib/postgresql/data && \
    chmod 777 /var/lib/postgresql/data

USER pgsql

EXPOSE 5432

CMD ["postgres", "-D", "/var/lib/postgresql/data", "-c", "config_file=/etc/postgresql/postgresql.conf"]
