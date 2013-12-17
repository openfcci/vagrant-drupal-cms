#!/usr/bin/env ruby
dumps = `curl http://dbdump.fccinteractive.com`
newest = dumps.scan(/(?mi)href="(production\.fccnn\.com[0-9_-]+?\.sql\.gz)"/).last[0]
system( 'echo "CREATE DATABASE vagrant_drupal_dev" | mysql -h localhost -u root -pvagrant_drupal_root_dev vagrant_drupal')
system( "wget http://dbdump.fccinteractive.com/#{newest}" )
system( "gunzip -c #{newest} | mysql -h localhost -u root -pvagrant_drupal_root_dev vagrant_drupal")
system( "rm -f #{newest}" )