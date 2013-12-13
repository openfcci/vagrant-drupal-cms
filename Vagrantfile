# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'ipaddr'

prefix = "dev"
ip = "172.16.0.10"
xdebug = "Off"

Vagrant.configure("2") do |config|
  config.vm.box = "fcc-vagrant-11-15-13"
  config.vm.box_url = "http://dbdump.fccinteractive.com/fcc-vagrant.box"
  config.ssh.forward_agent = true
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "4096"]
    v.customize ["modifyvm", :id, "--cpus", "1"]
    v.name = prefix
  end
  config.vm.define "db" do |db|
    db.vm.network :forwarded_port, guest: 3306, host: 3307, auto_correct: true
    db.vm.network :private_network, ip: IPAddr.new(ip).succ.to_s
    db.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.name = prefix + "db"
    end
    db.vm.provision "chef_solo" do |chef|
      chef.add_recipe "drupal-dev::database"
      chef.cookbooks_path = "chef/cookbooks"
      chef.json = {
        "drupal" => {
          "app" => {
            "ip" => ip,
          }
        }
      }
    end
  end
  config.vm.define "web", primary: true do |web|
    web.vm.network :private_network, ip: ip
    web.vm.synced_folder "../fcc-drupal-cms/", "/srv/cms", :nfs => true, :nfs_version => 3
    web.vm.synced_folder "database/", "/exports", :nfs => true, :nfs_version => 3
    web.vm.synced_folder "wwwconfig/", "/srv/cms/wwwconfig", :nfs => true
    web.vm.synced_folder "settings_override/", "/srv/cms/public_html/sites/settings_override", :nfs => true
    web.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.name = prefix + "web"
    end
    web.vm.provision "chef_solo" do |chef|
      chef.add_recipe "drupal-dev::web"
      chef.cookbooks_path = "chef/cookbooks"
      chef.json = {
        "drupal" => {
          "db" => {
            "host" => IPAddr.new(ip).succ.to_s
          },
          "xdebug" => {
            "enabled" => xdebug,
            "host" => "10.0.2.2",
            "port" => "9000",
            "remote_autostart" => "1"
          },
          "prefix" => prefix
        }
      }
    end
#    web.vm.mount_commands.command "service apache2 start"
  end
#  config.cache.auto_detect = true
#  config.cache.enable :apt
end
