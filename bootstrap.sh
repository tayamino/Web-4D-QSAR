#!/bin/bash

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

if [[ ! -d /opt/web4d-qsar ]] ; then
    git clone https://github.com/tayamino/web-4d-qsar /opt/web4d-qsar
fi

if [[ -d /opt/web4d-qsar ]] ; then
    cd /opt/web4d-qsar

    if [[ ! -f /etc/supervisor/conf.d/web4d-qsar.conf ]] ; then
        ln -s /opt/web4d-qsar/supervisor.conf /etc/supervisor/conf.d/web4d-qsar.conf
    fi

    pip install -r requirements/dev-requirements.txt

    cd ./src

    ./initialize.sh
fi

