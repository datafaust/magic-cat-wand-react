#!/bin/bash

# this script automates the ip gathering at every boot
# once the ip is written to a .env, it is exposed as a volume 
# for the react container to consume

# copy ip file to task and authorize
sudo cp /home/${USER}/magic-cat-wand-react/setup.sh /usr/local/bin/setup.sh
sudo chmod 744 /usr/local/bin/setup.sh

# create setup files
sudo cp /home/${USER}/magic-cat-wand-react/setup.service /etc/systemd/system/setup.service
sudo cp /home/${USER}/magic-cat-wand-react/setup.timer /etc/systemd/system/setup.timer

# add permissions for the service
sudo chmod 644 /etc/systemd/system/setup.service

# setup and reload systemctl
sudo systemctl daemon-reload
sudo systemctl enable setup.timer
sudo systemctl start setup.timer
