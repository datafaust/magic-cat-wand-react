#!/bin/bash

# create the ip address------------------------------------------------

# test existence of a directory
cd /home/pi/magic-cat-wand-react/

# if a directory exists create an env file
touch /home/pi/magic-cat-wand-react/.env

# assign the ip address to that env file
REACT_APP_MACHINE_HOST_IP="$(hostname -I | cut -d " " -f 2)"
echo "${REACT_APP_MACHINE_HOST_IP}"
echo "$(ls)"
destdir=/home/pi/magic-cat-wand-react/.env
echo "REACT_APP_MACHINE_HOST_IP=$REACT_APP_MACHINE_HOST_IP" > "$destdir"

# restart docker container------------------------------------------------
sleep 1
docker restart mcw-gui
