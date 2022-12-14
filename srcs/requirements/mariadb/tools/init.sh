#!bin/sh
if [ ! -d "var/lib/mysql/${DB_NAME}" ]; then 
	sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
	rc-service mariadb setup
	rc-service mariadb start
	mysql -u root

	USE mysql;

	#Reload privilege tables
	FLUSH PRIVILEGES;

	#Remove test Database
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

	#Delete anonymous user
	DELETE FROM mysql.global_priv WHERE User='';

	#Remove Remote root
	DELETE FROM mysql.global_priv WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	
	#Configure our database
	CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
	CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
	GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
	FLUSH PRIVILEGES;
	EOF
		rc-service mariadb restart
fi
