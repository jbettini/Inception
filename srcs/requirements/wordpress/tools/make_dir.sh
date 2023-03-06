#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir /home/${USER}/data
        mkdir /home/${USER}/data/wordpress
        mkdir /home/${USER}/data/mariadb
fi
