#!/bin/bash
CURRENT_DIR=`pwd`

if [[ -z "$1" ]]; then
    echo "Please specify the live database to restore"
    exit
fi

sudo sed -i "s/apc.stat=1/apc.stat=0/g" /etc/php5/conf.d/apc.ini
sudo service apache2 restart
cd /srv/cms/utilities
./dbutil.sh ../public_html restore $1
./upgrade_routine.sh
cd $CURRENT_DIR
sudo sed -i "s/apc.stat=0/apc.stat=1/g" /etc/php5/conf.d/apc.ini
sudo service apache2 restart
