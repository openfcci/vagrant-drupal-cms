#!/bin/bash
CURRENT_DIR=`pwd`
cd /srv/cms/utilities
hostname=`php lib/get_db_setting.php host`
dbname=`php lib/get_db_setting.php database`
username=`php lib/get_db_setting.php username`
password=`php lib/get_db_setting.php password`
echo "DROP DATABASE $dbname; CREATE DATABASE $dbname" | mysql -h $hostname -u $username -p$password $dbname
if [ ! -e $1 ]
    then
    rm -f *.sql.gz
    wget http://dbdump.fccinteractive.com/$1
fi
gunzip -c *.sql.gz | mysql -h $hostname -u $username -p$password $dbname
