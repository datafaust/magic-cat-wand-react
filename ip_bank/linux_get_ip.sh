#!/bin/bash

# test existence of a directory
cd ./magic-cat-wand-react/ip_bank/

# if a directory exists create an env file
touch .env

# assign the ip address to that env file
MACHINE_HOST_IP="$(hostname -I | cut -d " " -f 2)"
echo "${MACHINE_HOST_IP}"
echo "$(ls)"
destdir=.env
echo "MACHINE_HOST_IP=$MACHINE_HOST_IP" > "$destdir"