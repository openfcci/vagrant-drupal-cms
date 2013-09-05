include_recipe "mysql::server"
include_recipe "mysql::ruby"

include_recipe "database"

mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database 'vagrant_drupal' do
  connection mysql_connection_info
end

mysql_database_user 'vagrant_drupal' do
  connection mysql_connection_info
  password node['drupal']['db']['password']
  action :create
end

mysql_database_user 'vagrant_drupal' do
  connection mysql_connection_info
  password node['drupal']['db']['password']
  database_name 'vagrant_drupal'
  host 'localhost'
  privileges [:all]
  action :grant
end
