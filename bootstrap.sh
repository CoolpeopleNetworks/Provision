#!/bin/sh
# NOTE: Use this script to bootstrap a system which will install required packages for ansible-pull
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
fi

if [ "$NAME" == "Ubuntu" || "$NAME" == "Debian" ]; then
    sudo apt install -y openssh-server git ansible
fi
