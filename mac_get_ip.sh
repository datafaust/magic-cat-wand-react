 #!/bin/bash

cd ./ip_bank/

MACHINE_HOST_IP="$(ipconfig getifaddr en0)"
echo "${MACHINE_HOST_IP}"

# if a directory exists create an env file
touch .env

destdir=.env
echo "MACHINE_HOST_IP=$MACHINE_HOST_IP" > "$destdir"