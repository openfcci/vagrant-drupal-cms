#!/bin/bash
CURRENT_DIR=`pwd`
sudo sed -i 's/apc.stat=1/apc.stat=0/g' /etc/php5/conf.d/apc.ini
sudo service apache2 restart
cd /srv/cms/utilities
echo 'n' | ./default_setup.sh
cd $CURRENT_DIR
sudo sed -i 's/apc.stat=0/apc.stat=1/g' /etc/php5/conf.d/apc.ini
sudo service apache2 restart
