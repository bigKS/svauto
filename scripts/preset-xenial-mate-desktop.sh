#! /bin/bash

./svauto.sh --ansible-remote-user="root" \
	--ansible-inventory-builder="all,localhost,ansible_connection=local,ubuntu_install=desktop,os_release=newton" \
	--ansible-playbook-builder="localhost,bootstrap;base_os_upgrade=yes,grub-conf,ubuntu-mate-desktop,ssh_keypair,hyper_kvm,hyper_virtualbox,vagrant,os_clients,google-chrome,mattermost,sublime,ccollab-client,post-cleanup"
