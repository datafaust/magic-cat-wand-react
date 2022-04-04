#!/bin/bash

# test existence of a directory
cd /home/pi/magic-cat-wand-react/

# if a directory exists create an env file
touch /home/pi/magic-cat-wand-react/.env

# assign the ip address to that env file
MACHINE_HOST_IP="$(hostname -I | cut -d " " -f 2)"
echo "${MACHINE_HOST_IP}"
echo "$(ls)"
destdir=/home/pi/magic-cat-wand-react/.env
echo "MACHINE_HOST_IP=$MACHINE_HOST_IP" > "$destdir"