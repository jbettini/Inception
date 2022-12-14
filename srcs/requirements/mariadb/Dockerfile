FROM alpine:3.17

ARG	DB_NAME \
	DB_USER \
	DB_PASS \	
	DB_ROOT \

RUN	apk update && apk upgrade && apk add --no-cache mariadb mariadb-client
EXPOSE	3306
COPY	./tools/init.sh .
USER	mysql
RUN	sh init.sh && rm -rf init.sh
CMD	["mysqld_safe"]
