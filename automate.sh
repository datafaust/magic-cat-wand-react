#!/bin/bash

# this script automates the ip gathering at every boot
# once the ip is written to a .env, it is exposed as a volume 
# for the react container to consume

# copy ip file to task
cp /home/${USER}/magic-cat-wand-react/setup.sh /usr/local/bin/setup.sh

sudo chmod 744 /usr/local/bin/setup.sh
sudo chmod 644 /etc/systemd/system/setup.service
