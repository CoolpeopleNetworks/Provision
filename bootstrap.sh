#!/bin/sh
# 
# To use this script execute:
#
# curl https://raw.githubusercontent.com/CoolpeopleNetworks/Provision/trunk/bootstrap.sh | bash
#
# NOTE: Use this script to bootstrap a system which will install required packages for ansible-pull
if [ -f /etc/os-release ]; then
    . /etc/os-release
fi

case "$NAME" in 
    "Ubuntu" | "Debian")
        sudo apt install -y snapd ansible
        ;;
    *)
        echo "OS Name $NAME not recognized"
        ;;
esac

sudo apt autoremove

# Run initial Ansible pull
ansible-pull -U https://github.com/CoolpeopleNetworks/Provision.git