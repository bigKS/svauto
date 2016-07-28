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


clear


echo
echo "Welcome to SVAuto, the Sandvine Automation!"
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
echo "Deploying Sandvine Platform from RPM packages:"
echo
cd ~/svauto
./svauto.sh --freebsd-pts --os-project=demo --os-stack=demo --operation=cloud-services --cloud-services-mode=default
