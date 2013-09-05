# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "Precise"
  config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
  config.vm.hostname = "drupal"
  config.vm.network :forwarded_port, guest: 3306, host: 3307, auto_correct: true
  config.vm.network :private_network, ip: "172.16.0.10"
  config.vm.synced_folder "../fcc-drupal-cms/", "/srv/cms", :nfs => true, :nfs_version => 3
  config.vm.synced_folder "../database/", "/exports", :nfs => true, :nfs_version => 3
  config.vm.synced_folder "settings", "/srv/cms/public_html/sites/settings_override/", :nfs => true, :nfs_version => 3
  config.vm.synced_folder "config", "/srv/cms/wwwconfig", :nfs => true, :nfs_version => 3
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"]="4096"
    v.vmx["numvcpus"]="6"
    v.vmx["displayName"]="drupal"
  end
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.add_recipe "drupal-dev"
    chef.json = {
      "drupal" => {
        "prefix" => "drupal"
      },
      "mysql" => {
        "server_root_password" => "vagrant_drupal_root_dev",
        "server_repl_password" => "not_needed_in_dev",
        "server_debian_password" => "vagrant_drupal_debian_password",
        "allow_remote_root" => true
      }
    }
  end
end
