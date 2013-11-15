# -*- mode: ruby -*-
# vi: set ft=ruby :

prefix = "dev"
ip = "172.16.0.10"
xdebug = "Off"

Vagrant.configure("2") do |config|
  config.vm.box = "fcc-vagrant-11-15-13"
  config.vm.box_url = "http://dbdump.fccinteractive.com/fcc-vagrant.box"
  config.vm.hostname = prefix
  config.vm.network :forwarded_port, guest: 3306, host: 3307, auto_correct: true
  config.vm.network :private_network, ip: ip
  config.vm.synced_folder "../fcc-drupal-cms/", "/srv/cms", :nfs => true, :nfs_version => 3
  config.vm.synced_folder "database/", "/exports", :nfs => true, :nfs_version => 3
  config.vm.synced_folder "wwwconfig/", "/srv/cms/wwwconfig", :nfs => true
  config.vm.synced_folder "settings_override/", "/srv/cms/public_html/sites/settings_override", :nfs => true
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "4096"]
    v.customize ["modifyvm", :id, "--cpus", "1"]
    v.name = prefix
  end
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.add_recipe "drupal-dev"
    chef.json = {
      "drupal" => {
        "xdebug" => {
          "enabled" => xdebug,
          "host" => "10.0.2.2",
          "port" => "9000",
          "remote_autostart" => "1"
        },
        "prefix" => prefix
      },
      "mysql" => {
        "server_root_password" => "vagrant_drupal_root_dev",
        "server_repl_password" => "not_needed_in_dev",
        "server_debian_password" => "vagrant_drupal_debian_password",
        "allow_remote_root" => true
      }
    }
  end
  config.vm.provision :shell, :inline => '/home/vagrant/faster_default_build.sh'
  config.mount_commands.command "service apache2 start"
  config.cache.auto_detect = true
  config.cache.enable :apt
end
