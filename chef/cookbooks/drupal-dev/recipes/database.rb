include_recipe 'apt'

apt_repository 'docker' do
  uri 'http://get.docker.io/ubuntu'
  distribution 'docker'
  components ['main']
  key 'https://get.docker.io/gpg'
end

package 'lxc-docker'

template '/home/vagrant/set-access-rights.sh' do
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

template '/home/vagrant/Dockerfile' do
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

execute "build docker image" do
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant"
  command 'sudo docker build -t="mysql/base" .'
end

cookbook_file "/home/vagrant/commit.sh" do
  owner "vagrant"
  group "vagrant"
  mode "0750"
end
