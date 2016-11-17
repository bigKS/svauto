#! /bin/bash

curl -s https://raw.githubusercontent.com/sandvine-eng/svauto/dev/scripts/svauto-deployments.sh | bash -s -- --base-os=centos6 --ansible-remote-user="root" --ansible-inventory-builder="all,localhost,ansible_connection=local,base_os=centos6" --ansible-playbook-builder="localhost,bootstrap,grub-conf,svspb,post-cleanup"
