#!/bin/bash
vagrant ssh -c "drush cc all && sudo service memcached restart"
