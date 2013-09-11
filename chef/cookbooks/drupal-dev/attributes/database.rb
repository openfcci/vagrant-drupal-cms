override['mysql']['bind_address'] = '0.0.0.0'
default['drupal']['db']['password'] = 'password'

# Tune mysql for vagrant
override['mysql']['tunable']['key_buffer_size']='1536M'
override['mysql']['tunable']['tmp_table_size']='32M'
override['mysql']['tunable']['max_connections']='800'
override['mysql']['tunable']['thread_cache']=16
override['mysql']['tunable']['open-files-limit']='65535'
override['mysql']['tunable']['table_open_cache']='4096'
override['mysql']['tunable']['innodb_buffer_pool_size']='1536M'
