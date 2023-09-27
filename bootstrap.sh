#!/bin/sh
# NOTE: Use this script to bootstrap a system which will install required packages for ansible-pull
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
fi

case "$NAME" in 
    "Ubuntu" | "Debian")
        sudo apt install -y git ansible
        ;;
    *)
        echo "OS Name $NAME not recognized"
        ;;
esac

sudo apt autoremove

# Run initial Ansible pull
ansible-pull -U https://github.com/CoolpeopleNetworks/Provision.git