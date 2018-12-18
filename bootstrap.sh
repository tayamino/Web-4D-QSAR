#!/bin/bash

sudo apt-get install -y --force-yes build-essential cmake git python python-dev python-pip rabbitmq-server dos2unix

sudo apt-get install -y --force-yes rabbitmq-server gromacs

#topobuild

cd /tmp
wget -nv http://www.gromacs.org/@api/deki/files/93/=topolbuild1_3.tgz -O topolbuild1_3.tgz
tar xvfz topolbuild1_3.tgz
cd topolbuild1_3/src
make
sudo cp -r /tmp/topolbuild1_3 /opt
sudo chmod a+x /opt/topolbuild1_3/src/topolbuild
sudo ln -s /opt/topolbuild1_3/src/topolbuild /usr/bin/topolbuild


git clone https://github.com/rougeth/web-4d-qsar /opt/web4d-qsar

cd /opt/web4d-qsar

pip install -r requirements.txt

./initialize.sh

