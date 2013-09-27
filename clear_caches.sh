#!/bin/bash
CD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$CD/drush cc all
vagrant ssh -c "sudo service memcached restart"
