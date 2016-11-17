#! /bin/bash

curl -s https://raw.githubusercontent.com/sandvine-eng/svauto/dev/scripts/svauto-deployments.sh | bash -s -- --base-os=ubuntu16 --ansible-remote-user="root" --ansible-inventory-builder="all,localhost,ansible_connection=local,base_os=ubuntu16,ubuntu_install=desktop,os_release=newton" --ansible-playbook-builder="localhost,bootstrap;base_os_upgrade=yes,grub-conf,hyper_kvm,hyper_lxd,hyper_virtualbox,docker,vagrant,amazon_ec2_tools,redhat_tools_ubuntu,os_clients,packer,vsftpd,post-cleanup"
