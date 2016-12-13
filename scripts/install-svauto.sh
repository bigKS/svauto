#! /bin/bash

curl -s https://git.sandvine.com/eng/svauto/raw/dev/scripts/svauto-deployments.sh | bash -s -- --base-os=ubuntu16 --ansible-remote-user="root" --ansible-inventory-builder="all,localhost,ansible_connection=local" --ansible-playbook-builder="localhost,bootstrap"
