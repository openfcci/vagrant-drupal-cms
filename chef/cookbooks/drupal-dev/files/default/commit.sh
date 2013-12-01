#!/bin/bash
docker commit -run='{"cmd": ["/usr/sbin/mysqld"], "expose": ["3306"]}' $1 $2
