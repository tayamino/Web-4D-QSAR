#!/bin/bash

cd /opt/web4d-qsar/src

python manage.py makemigrations

python manage.py migrate


