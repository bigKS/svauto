#! /bin/bash

curl -s https://raw.githubusercontent.com/sandvine-eng/svauto/dev/svauto.sh | bash -s -- --svauto-deployments --base-os=ubuntu16 --ansible-roles=bootstrap,grub-conf,hyper_kvm,post-cleanup --ansible-extra-vars="base_os_upgrade=yes,ubuntu_install=desktop"
