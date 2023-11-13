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
        sudo apt install -y snapd cron git ansible
        ;;
    *)
        echo "OS Name $NAME not recognized"
        ;;
esac

sudo apt autoremove

sudo mkdir -p /usr/share/ansible/roles/
sudo git clone https://github.com/istvano/ansible_role_microk8s /usr/share/ansible/roles/istvano.microk8s

# Run initial Ansible pull
ansible-pull -U https://github.com/CoolpeopleNetworks/Provision.git