#! /bin/bash

# Copyright 2016, Sandvine Incorporated.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


FQDN=$(hostname -f)


clear


echo
echo "Welcome to OpenStack Mitaka Deployment!"
echo


echo
echo "Installing Git and Ansible..."
echo
sudo apt -y install software-properties-common

sudo add-apt-repository -y ppa:sandvine/packages

sudo apt update

sudo apt -y install git ansible


echo
echo "Downloading SVAuto into your home directory..."
echo
cd ~
git clone -b dev https://github.com/sandvine-eng/svauto.git


echo
echo "Deploying OpenStack..."
echo
echo "Bridge Mode: Linux Bridges"
echo
cd ~/svauto
./svauto.sh --operation=openstack --br-mode=LBR --use-dummies --base-os=ubuntu16 --base-os-upgrade=yes --openstack-release=mitaka --deployment-mode


echo
echo "Well done!"
echo
echo "Point your browser to http://$FQDN"
echo
echo "The credentials for both admin and demo users are stored at the"
echo "admin-openrc.sh and demo-openrc.sh files located inside your home."
echo
echo "You can now launch your Stacks! Be it a NFV L2 Bridge or just a Wordpress."
echo "There are a few examples here at your home, for example, you can try:"
echo
echo " * Launch a very simple Ubuntu stack:"
echo
echo "source ~/demo-openrc.sh"
echo
echo "heat stack-create demo -f ~/svauto/misc/os-heat-templates/demo-stack.yaml"
echo
echo "Enjoy it!"
echo
