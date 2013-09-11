#!/bin/bash
vagrant ssh -c "cd /srv/cms/public_html && drush cc all" && \
vagrant ssh -c "sudo service memcached restart"
