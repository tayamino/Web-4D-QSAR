#!/bin/bash

TARGET_DIR=/opt/web4d-qsar

if [[ -d /vagrant ]] ; then
	TARGET_DIR=/vagrant
fi

sudo apt-get install -y --force-yes build-essential cmake git python python-dev python-pip \
                                    dos2unix gromacs \
                                    supervisor rabbitmq-server

if [[ ! -f /usr/bin/topolbuild ]] ; then
    cd /tmp
    wget -nv http://www.gromacs.org/@api/deki/files/93/=topolbuild1_3.tgz -O topolbuild1_3.tgz
    tar xvfz topolbuild1_3.tgz
    cd topolbuild1_3/src
    make
    sudo cp -r /tmp/topolbuild1_3 /opt
    sudo chmod a+x /opt/topolbuild1_3/src/topolbuild
    sudo ln -s /opt/topolbuild1_3/src/topolbuild /usr/bin/topolbuild
fi

if [[ ! -d $TARGET_DIR ]] ; then
    git clone https://github.com/tayamino/web-4d-qsar $TARGET_DIR
else
    git pull
fi

if [[ -d $TARGET_DIR ]] ; then
    cd $TARGET_DIR

    if [[ ! -e /etc/supervisor/conf.d/web4d-qsar.conf ]] ; then
        ln -sf $TARGET_DIR/supervisor.conf /etc/supervisor/conf.d/web4d-qsar.conf
    fi

    sudo pip install -r requirements.txt

    cd ./src

    ../initialize.sh
fi

sudo supervisorctl reread
sudo supervisorctl update
