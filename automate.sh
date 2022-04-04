#!/bin/bash

# this script automates the ip gathering at every boot
# once the ip is written to a .env, it is exposed as a volume 
# for the react container to consume

# copy ip file to task
cp /home/pi/magic-cat-wand-react/linux_get_ip.sh /usr/local/bin/linux_get_ip.sh

sudo chmod 744 /usr/local/bin/linux_get_ip.sh
sudo chmod 644 /etc/systemd/system/get_ip.service