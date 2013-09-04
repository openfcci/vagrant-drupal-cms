# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "grahamc-12.04.2"
  config.vm.box_url = "http://grahamc.com/vagrant/ubuntu-12.04.2-server-amd64-vmware-fusion.box"
  config.vm.hostname = "drupal"
  config.vm.network :forwarded_port, guest: 3306, host: 3307
  config.vm.network :private_network, ip: "172.16.0.10"
  config.vm.synced_folder "/Users/brendan/Developer/fcc-drupal-cms/", "/srv/cms", :nfs => true, :nfs_version => 3
  config.vm.synced_folder "/Users/brendan/Developer/database/", "/exports", :nfs => true, :nfs_version => 3
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"]="4096"
    v.vmx["numvcpus"]="6"
    v.vmx["displayName"]="DrupalServer"
  end
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.json = {
      "mysql" => {
        "server_root_password" => "vagrant_drupal_root_dev",
        "server_repl_password" => "not_needed_in_dev",
        "server_debian_password" => "vagrant_drupal_debian_password",
        "allow_remote_root" => true
      }
    }
  end
end
