#!/bin/bash

# create the ip address------------------------------------------------

# test existence of a directory
#cd /home/${USER}/magic-cat-wand-react/

# if a directory exists create an env file
echo "CREATING ENV VARIABLE"
#touch /home/${USER}/magic-cat-wand-react/.env

# assign the ip address to that env file
REACT_APP_MACHINE_HOST_IP="$(hostname -I | cut -d " " -f 2)"
echo "${REACT_APP_MACHINE_HOST_IP}"
echo "$(ls)"

#destdir=/home/"$USER"/magic-cat-wand-react/.env
#cd /home/"$USER"/magic-cat-wand-react/
#touch .env
destdir=/home/fausto/magic-cat-wand-react/.env
echo "REACT_APP_MACHINE_HOST_IP=$REACT_APP_MACHINE_HOST_IP" > "$destdir"

# restart docker container------------------------------------------------

sleep 2

docker restart mcw-gui
