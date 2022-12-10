FROM alpine:3.17

ARG	DB_NAME \
	DB_USER \
	DB_PASS \	
	DB_ROOT \

RUN	apk update && apk upgrade && apk add --no-cache mariadb mariadb-client
EXPOSE	3306
USER	mysql
COPY	./tools/init.sh .
RUN	sh init.sh && rm -rf init.sh
