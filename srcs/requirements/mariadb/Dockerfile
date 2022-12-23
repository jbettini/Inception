FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_ROOT \
    DB_PASS

RUN	apk update && apk upgrade && apk add --no-cache mariadb mariadb-client openrc
RUN	openrc && touch /run/openrc/softlevel

EXPOSE 3306

COPY tools/init.sh .
RUN sh init.sh && rm init.sh
USER mysql
CMD ["mysqld_safe"]
