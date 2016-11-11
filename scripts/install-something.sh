#! /bin/bash

curl -s https://raw.githubusercontent.com/sandvine-eng/svauto/dev/scripts/svauto-deployments.sh | bash -s -- --base-os=centos7 --ansible-playbook-builder="localhost,bootstrap:base_os_upgrade=yes,grub-conf" --ansible-extra-vars="spb_service_ip=1.1.1.1,cluster_name=sandvine"
